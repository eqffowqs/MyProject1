package com.base.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.util.Random;

@RequestMapping("/wang")
@Controller
public class VerifyController {
    private int width=90;
    private int height=30;
    private int codeCount=4;
    private int xx=15;
    private int fontHeight=20;
    private int codeY=20;

    char[] codeSequence={'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X',
            'Y', 'Z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'};

    @RequestMapping("/verify.action")
    public void getCode(HttpServletRequest req, HttpServletResponse resp) throws Exception{
        BufferedImage bufferedImage=new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
        Graphics gd=bufferedImage.getGraphics();
        Random random=new Random();
        gd.setColor(Color.white);
        gd.fillRect(0,0,width,height);

        Font font=new Font("Fixedsys", Font.BOLD,fontHeight);
        gd.setFont(font);
        gd.setColor(Color.BLACK);
        gd.drawRect(0,0,width-1,height-1);
        gd.setColor(Color.pink);
        for(int i=0;i<40;i++){
            int x=random.nextInt(width);
            int y=random.nextInt(height);
            int x1=random.nextInt(12);
            int y1=random.nextInt(12);
            gd.drawRect(x,y,x+x1,y+y1);
        }

        StringBuffer randomCode=new StringBuffer();
        int red=0, green=0,blue=0;
        for(int i=0;i<codeCount;i++){
            String code=String.valueOf(codeSequence[random.nextInt(codeSequence.length-1)]);
            red =random.nextInt(255);
            green=random.nextInt(255);
            blue=random.nextInt(255);
            gd.setColor(new Color(red,green,blue));
            gd.drawString(code,(i+1)*xx,codeY);
            randomCode.append(code);
        }

        HttpSession httpSession=req.getSession();
        System.out.print(randomCode+"======");
        httpSession.setAttribute("VERIFY",randomCode.toString());

        resp.setHeader("Pragma","no-cache");
        resp.setHeader("Cache-Control","no-cache");
        resp.setDateHeader("Expires",0);
        resp.setContentType("image/jpeg");

        ServletOutputStream sos=resp.getOutputStream();
        ImageIO.write(bufferedImage,"jpeg",sos);
        sos.close();

    }

}
