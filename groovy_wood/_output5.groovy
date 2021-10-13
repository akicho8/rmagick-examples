@Grab(group='com.jhlabs', module='filters', version='2.0.235')
import java.awt.*
import java.awt.image.*
import java.io.*
import javax.imageio.*
import com.jhlabs.composite.*
import com.jhlabs.image.*
def img = new BufferedImage(1080, 1080, BufferedImage.TYPE_INT_RGB)
def wf = new WoodFilter()
wf.setRings(0.15f)                             // rings value
wf.setScale(100)                             // スケール
wf.setStretch(10f)                        // 伸張率
wf.setTurbulence(0f)                  // 乱れ
wf.setFibres(0)                           // 繊維の量
def lc = new LinearColormap((int)0xFFc2ab70, (int)0xFFc9b582)
wf.setColormap(lc)

img = wf.filter(img, null)
ImageIO.write(img, "png", new File("../../bioshogi/lib/bioshogi/assets/images/board/groovy_board_texture06.png"))
