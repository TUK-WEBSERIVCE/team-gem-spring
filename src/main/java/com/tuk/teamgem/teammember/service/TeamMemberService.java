package com.tuk.teamgem.teammember.service;

import com.tuk.teamgem.comment.domain.Comment;
import com.tuk.teamgem.comment.service.CommentService;
import com.tuk.teamgem.member.domain.Member;
import com.tuk.teamgem.member.service.MemberService;
import com.tuk.teamgem.team.domain.Team;
import com.tuk.teamgem.team.service.TeamService;
import com.tuk.teamgem.teammember.domain.ApplicationStatus;
import com.tuk.teamgem.teammember.domain.TeamMember;
import com.tuk.teamgem.teammember.dto.ApproveRequest;
import com.tuk.teamgem.teammember.dto.MyTeamResponse;
import com.tuk.teamgem.teammember.dto.TeamJoinRequest;
import com.tuk.teamgem.teammember.repository.TeamMemberRepository;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class TeamMemberService {

    private final TeamMemberRepository teamMemberRepository;
    private final TeamService teamService;
    private final MemberService memberService;
    private final CommentService commentService;

    @Transactional
    public void joinRequest(Long memberId, Long teamId, TeamJoinRequest teamJoinRequest){
        Member member = memberService.getMember(memberId);
        Team team = teamService.getTeam(teamId);
        TeamMember teamMember = TeamMember.builder()
            .team(team)
            .member(member)
            .field(teamJoinRequest.field())
            .introduction(teamJoinRequest.introduction())
            .applicationStatus(ApplicationStatus.PENDING)
            .build();
        teamMemberRepository.save(teamMember);
    }

    public List<TeamMember> findMyTeams(Long memberId){
        Member member = memberService.getMember(memberId);
        return teamMemberRepository.findAllByMember(member,ApplicationStatus.APPROVED);
    }

    public MyTeamResponse findMyTeam(Long teamId, Long memberId){
        Team team = teamService.getTeam(teamId);
        List<TeamMember> teamMembers = teamMemberRepository.findByTeam(team);
        boolean isHost = team.isHost(memberId);
        List<Comment> comments = commentService.findAllByTeam(team);
        return new MyTeamResponse(teamMembers,isHost,comments);
    }

    @Transactional
    public void approve(ApproveRequest request){
        Team team = teamService.getTeam(request.getTeamId());
        Member member = memberService.getMember(request.getMemberId());
        team.participateOne();
        TeamMember teamMember = teamMemberRepository.findByMemberAndTeam(member, team)
            .orElseThrow(() -> new RuntimeException("팀멤버 없음"));
        teamMember.approve();
    }

    @Transactional
    public void reject(ApproveRequest request){
        Team team = teamService.getTeam(request.getTeamId());
        Member member = memberService.getMember(request.getMemberId());
        TeamMember teamMember = teamMemberRepository.findByMemberAndTeam(member, team)
            .orElseThrow(() -> new RuntimeException("팀멤버 없음"));
        teamMember.reject();
    }

    public List<TeamMember> findApplication(Long memberId){
        Member member = memberService.getMember(memberId);
        return teamMemberRepository.findApplicationByMember(member);
    }
}
