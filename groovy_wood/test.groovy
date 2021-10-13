@Grab(group='com.jhlabs', module='filters', version='2.0.235')

import java.awt.*
import java.awt.image.*
import java.io.*
import javax.imageio.*
import com.jhlabs.composite.*
import com.jhlabs.image.*

// 木目調の画像を生成する
// TYPE_BYTE_INDEXED
// TYPE_INT_RGB
// TYPE_INT_ARGB
// TYPE_3BYTE_BGR
// TYPE_4BYTE_ABGR
// TYPE_4BYTE_ABGR_PRE
// TYPE_INT_BGR
def img = new BufferedImage(1280, 720, BufferedImage.TYPE_INT_RGB)
def wf = new WoodFilter()

wf.setRings(0.5f)                          // rings value
wf.setScale(100)                           // スケール
wf.setStretch(8.0f)                        // 伸張率
wf.setAngle((float)(ImageMath.PI * 2 * 0)) // 角度
wf.setTurbulence(0.2f)                     // 乱れ
wf.setFibres(0)                            // 繊維の量

img = wf.filter(img, null)
ImageIO.write(img, "png", new File("_wood.png"))
