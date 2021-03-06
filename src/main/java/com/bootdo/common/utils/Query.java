package com.bootdo.common.utils;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.stream.Stream;

/**
 * 查询参数
 */
public class Query extends LinkedHashMap<String, Object> {
    private static final long serialVersionUID = 1L;
    //
    private int offset;
    // 每页条数
    private int limit;

    public Query(Map<String, Object> params) {
        this.putAll(params);
        // 分页参数
        if (params.get("offset") != null)
            this.offset = Integer.parseInt(params.get("offset").toString());
        else
            this.offset = 0;
        if (params.get("limit") != null)
            this.limit = Integer.parseInt(params.get("limit").toString());
        this.put("offset", offset);
        this.put("page", limit != 0 ? offset / limit + 1 : 0);
        this.put("limit", limit);
    }

    public int getOffset() {
        return offset;
    }

    public void setOffset(int offset) {
        this.put("offset", offset);
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }
}
