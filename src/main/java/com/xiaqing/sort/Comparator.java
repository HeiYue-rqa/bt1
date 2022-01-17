package com.xiaqing.sort;

import java.util.Collections;
import java.util.List;

import com.xiaqing.model.CommentModel;

public class Comparator {

	public static List<CommentModel> reverse(List<CommentModel> list) {
        Collections.sort(list, new java.util.Comparator<CommentModel>() {
            @Override
        	public int compare(CommentModel o1, CommentModel o2) {
                return o2.getId().compareTo(o1.getId());
            }
        });
        return list;
    }
}