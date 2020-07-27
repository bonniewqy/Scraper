package com.schmidtgan.code.service.impl;


import com.schmidtgan.code.mapper.SnippetMapper;
import com.schmidtgan.code.pojo.Snippet;
import com.schmidtgan.code.service.SnippetService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class SnippetServiceImpl implements SnippetService {
    @Autowired
    SnippetMapper snippetMapper;


    @Override
    public List<Snippet> search_results(String url) {
        return snippetMapper.search_results(url);
    }



}
