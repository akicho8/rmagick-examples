// -*- compile-command: "./run.sh 800 600 _output.png; open _output.png;" -*-
// http://kyle-in-jp.blogspot.com/2008/10/java2djava-image-filterspixels_07.html

import java.awt.*;
import java.awt.geom.*;
import java.awt.image.*;
import java.io.*;
import java.util.*;
import javax.imageio.*;
import com.jhlabs.image.*;

public class FBM {
    public static void main(String args[]) throws Exception {
        int w = Integer.parseInt(args[0]);
        int h = Integer.parseInt(args[1]);
        String output_file = args[2];
        float amount       = Float.valueOf(args[3]);
        float scale        = Float.valueOf(args[4]);
        float stretch      = Float.valueOf(args[5]);
        float angle        = Float.valueOf(args[6]);
        int cm_count = Integer.parseInt(args[7]);

        // System.out.println(w);
        // System.out.println(h);
        // System.out.println(output_file);

        BufferedImage img = new BufferedImage(w, h, BufferedImage.TYPE_INT_RGB);

        FBMFilter fbmf = new FBMFilter();
        fbmf.setAmount(amount);               /* effect量 */
        fbmf.setOperation(FBMFilter.NOISE);   /* 操作タイプ */
        fbmf.setScale(scale);                 /* スケール */
        fbmf.setStretch(stretch);             /* 引き伸ばし率 */
        // fbmf.setAngle(10f/180f*ImageMath.PI); /* 角度 */
        fbmf.setAngle(angle * ImageMath.PI / 180f); /* 角度 */

        ArrayColormap ac = new ArrayColormap();
        // ac.setColorRange(  0, 100, 0x00000000, 0xffff8040);
        // ac.setColorRange(101, 200, 0xffff8040, 0xffffff60);
        // ac.setColorRange(201, 255, 0xffffff60, 0xffffffe0);

        for (int i = 0; i < cm_count; i++) {
            int a = Integer.parseInt(args[8 + i * 4 + 0]);
            int b = Integer.parseInt(args[8 + i * 4 + 1]);
            int c = Integer.parseInt(args[8 + i * 4 + 2]);
            int d = Integer.parseInt(args[8 + i * 4 + 3]);
            ac.setColorRange(a, b, c, d);
        }
        fbmf.setColormap(ac);

        BufferedImage img2 = fbmf.filter(img, null);
        ImageIO.write(img2, "png", new File(output_file));
    }
}
