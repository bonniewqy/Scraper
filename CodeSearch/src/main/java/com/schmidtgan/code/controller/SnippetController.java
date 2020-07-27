package com.schmidtgan.code.controller;

import com.schmidtgan.code.pojo.Snippet;
import com.schmidtgan.code.service.SnippetService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("")
public class SnippetController {
    @Autowired
    SnippetService snippetService;

    @ResponseBody
    @RequestMapping(method = RequestMethod.POST,value = "result_code")
    public String list(HttpSession session, HttpServletRequest request){
        String url = request.getParameter("url");
        System.out.println(url);
        List<Snippet> ss = snippetService.search_results(url);


        session.setAttribute("cs",ss);
        return "result";
    }

    @RequestMapping("code_content")
    public String getContent(Model model,HttpSession session,HttpServletRequest request){
        List<Snippet> ss = (List<Snippet>) session.getAttribute("cs");
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println(id);
        for (Snippet s:ss){
            if (s.getId()==id){
                model.addAttribute("code",s);
                break;
            }
        }
        return "code";
    }

    @RequestMapping("code_list")
    public String codeList(){
        return "result";
    }
    @RequestMapping("")
    public String home(){
        return "search";
    }
}
