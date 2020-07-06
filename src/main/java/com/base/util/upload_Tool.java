package com.base.util;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

public class upload_Tool {

    public static String uploadImg(MultipartFile file)
            throws IllegalStateException,IOException{
        String name=UUID.randomUUID().toString();
        String imgName=file.getOriginalFilename();
        String exName=imgName.substring(imgName.indexOf("."));
        String lastName=name+exName;

        file.transferTo(new File(
                "D:\\workspace\\idea\\MyProject1\\imgs"+lastName));
        return lastName;
    }

    public static boolean deleteFile(String name){
        boolean f=true;
        File file=new File(
                "D:\\workspace\\idea\\MyProject1\\imgs"+name);
        if (file.exists()&&file.isFile())
            f=file.delete();
        return f;
    }

}
