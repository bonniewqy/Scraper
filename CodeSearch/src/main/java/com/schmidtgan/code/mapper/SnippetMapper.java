package com.schmidtgan.code.mapper;

import com.schmidtgan.code.pojo.Snippet;


import java.util.List;

public interface SnippetMapper {
    List<Snippet> search_results(String url);

}
