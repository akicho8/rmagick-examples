@Grab(group='com.jhlabs', module='filters', version='2.0.235')
import java.awt.*
import java.awt.image.*
import java.io.*
import javax.imageio.*
import com.jhlabs.composite.*
import com.jhlabs.image.*
def img = new BufferedImage(256, 256, BufferedImage.TYPE_INT_RGB)
def wf = new WoodFilter()
wf.setRings(0.15f)                             // rings value
wf.setScale(10)                             // スケール
wf.setStretch(100f)                        // 伸張率
wf.setAngle((float)(ImageMath.PI * 2 * 0)) // 角度
wf.setTurbulence(0f)                  // 乱れ
wf.setFibres(0)                           // 繊維の量
def lc = new LinearColormap((int)0xFFfaeed1, (int)0xFFf7e6ba)
wf.setColormap(lc)

img = wf.filter(img, null)
ImageIO.write(img, "png", new File("../../bioshogi/lib/bioshogi/assets/images/piece/groovy_piece_texture03.png"))