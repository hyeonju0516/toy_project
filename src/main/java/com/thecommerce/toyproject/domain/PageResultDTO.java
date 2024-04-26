package com.thecommerce.toyproject.domain;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import lombok.Data;


@Data
public class PageResultDTO<T> {
	
    private List<T> entityList;

    private int totalPage;
    private int page;
    private int size;
    
    private int start, end;
    private boolean prev, next;
    private List<Integer> pageList;
	
    public PageResultDTO(Page<T> result){
    	entityList = result.getContent(); 
        totalPage = result.getTotalPages();
        makePageList(result.getPageable());
    }

    private void makePageList(Pageable pageable){

        this.page = pageable.getPageNumber() + 1;
        this.size = pageable.getPageSize();

        int tempEnd = (int)(Math.ceil(page/10.0)) * 10;

        start = tempEnd - 9;
        end = totalPage > tempEnd ? tempEnd: totalPage;
        
        prev = start > 1;
        next = totalPage > tempEnd;

        pageList = IntStream.rangeClosed(start, end).boxed().collect(Collectors.toList());
    }
	
}
