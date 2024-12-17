package com.tuk.teamgem.comment.service;

import com.tuk.teamgem.comment.domain.Comment;
import com.tuk.teamgem.comment.dto.CommentSaveRequest;
import com.tuk.teamgem.comment.repository.CommentRepository;
import com.tuk.teamgem.member.domain.Member;
import com.tuk.teamgem.member.service.MemberService;
import com.tuk.teamgem.team.domain.Team;
import com.tuk.teamgem.team.service.TeamService;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class CommentService {

    private final CommentRepository commentRepository;
    private final MemberService memberService;
    private final TeamService teamService;

    @Transactional
    public void saveComment(Long memberId, CommentSaveRequest request){
        Member member = memberService.getMember(memberId);
        Team team = teamService.getTeam(request.teamId());
        Comment comment = new Comment(request.content(), member, team);
        commentRepository.save(comment);
    }

    public List<Comment> findAllByTeam(Team team){
        return commentRepository.findAllByTeam(team);
    }
}
