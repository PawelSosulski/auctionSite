package com.auction.dto;

import lombok.Data;

@Data
public class FileDTO {

    private String contentType;

    private String fileName;

    private byte[] data;

    private String dataAsString;

}
