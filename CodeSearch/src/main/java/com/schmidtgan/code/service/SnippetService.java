package com.schmidtgan.code.service;

import com.schmidtgan.code.pojo.Snippet;


import java.util.List;

public interface SnippetService {
    List<Snippet> search_results(String url);
}
