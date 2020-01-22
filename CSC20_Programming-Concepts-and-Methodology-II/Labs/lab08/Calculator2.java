/*Mario Palacios
  CSC 20 - 03
  10 - 31 - 2018 
  Lab 08 
*/
import javax.swing.*;
import java.awt.*;
public class Calculator2 {
static String[] calc = {"7","8","9","/","4","5","6","*","1","2","3","-","0",".","+","=","C"};
	public static void main (String[] args) {
		JFrame frm = new JFrame("Mario's Calculator");
		JLabel label = new JLabel("CSC 20 Lab08", JLabel.CENTER);
		JTextField text = new JTextField ("0", JTextField.CENTER);
		JPanel panelA = new JPanel(new GridLayout(0,1));
		panelA.add(label);
		Container contentPane = frm.getContentPane();
		contentPane.setLayout(new GridLayout(0,1));
		contentPane.add(panelA);
		text.setHorizontalAlignment(JTextField.RIGHT);
		contentPane.add(text);
		JPanel panelB = new JPanel (new GridLayout (0,4,2,2));
		JPanel panelC = new JPanel (new GridLayout (0,4,2,2));
		JPanel panelD = new JPanel (new GridLayout (0,4,2,2));
		JPanel panelE = new JPanel (new GridLayout (1,2,2,2));
		JPanel panelF = new JPanel (new GridLayout (1,2,2,2));
		JPanel panelG = new JPanel (new GridLayout (0,2,2,2));
		for (int i = 0; i <= 3 ; ++i) { 
			panelB.add(new JButton("" + calc[i]));
		}
		contentPane.add(panelB);
		for (int i = 4; i <= 7; ++i) { 
			panelC.add(new JButton("" + calc[i]));
		}
		contentPane.add(panelC);
		for (int i = 8; i <= 11; ++i) { 
			panelD.add(new JButton ("" + calc[i]));
		} 
		contentPane.add(panelD);
		panelE.add(new JButton ("" + calc[12]));
		for (int i = 13; i <= 14; ++i) { 
			panelF.add(new JButton ("" + calc[i]));
		}
		panelE.add(panelF);
		contentPane.add(panelE);
		for (int i = 15; i <= 16; ++i) { 
			panelG.add(new JButton("" + calc[i]));
		}
		contentPane.add(panelG);
		frm.pack();
		frm.setSize(318,220);
		//frm.SetResizable(false);
		frm.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frm.setVisible(true);
	}
}