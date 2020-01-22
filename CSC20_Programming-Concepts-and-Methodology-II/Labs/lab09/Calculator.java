/*Mario Palacios
  CSC 20 - 03
  11 - 07 - 2018 
  Lab 09 
*/
import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
public class Calculator implements ActionListener {
static String[] calc = {"BkSP","CE","C","/","sqrt","7","8","9","*","%","4","5","6","-","1/x","1","2","3","+","+/-","0",".","="};
static boolean newNumber = true;
static double oprnd1 = 0;
static double oprnd2 = 0; 
static double res = 0;
static char operator = ' '; 
static JButton[] Button = new JButton[calc.length];
static JTextField tf = new JTextField("0", JTextField.CENTER);
	public static void main (String[] args) {
		//JButton[] Button = new JButton[calc.length];
		JFrame frm = new JFrame("Mario's Calculator");
		JLabel label = new JLabel("CSC 20 Lab08", JLabel.CENTER);
		JPanel panelA = new JPanel(new GridLayout(0,1));
		panelA.add(label);
		Container contentPane = frm.getContentPane();
		contentPane.setLayout(new GridLayout(0,1));
		contentPane.add(panelA);
		tf.setHorizontalAlignment(JTextField.RIGHT);
		contentPane.add(tf);
		JPanel panelB = new JPanel (new GridLayout (0,5,2,2));
		JPanel panelC = new JPanel (new GridLayout (0,5,2,2));
		JPanel panelD = new JPanel (new GridLayout (0,5,2,2));
		JPanel panelE = new JPanel (new GridLayout (1,2,2,2));
		JPanel panelF = new JPanel (new GridLayout (1,2,2,2));
		ActionListener AL = new Calculator();
		for (int i = 0; i <= 4 ; ++i) { 
			panelB.add(Button[i] = new JButton("" + calc[i]));
			Button[i].addActionListener(AL);
		}
		contentPane.add(panelB);
		for (int i = 5; i <= 9; ++i) { 
			panelC.add(Button[i] = new JButton("" + calc[i]));
			Button[i].addActionListener(AL);
		}
		contentPane.add(panelC);
		for (int i = 10; i <= 14; ++i) { 
			panelD.add(Button[i] = new JButton ("" + calc[i]));
			Button[i].addActionListener(AL);
		} 
		contentPane.add(panelD);
		for (int i = 15; i <= 19; ++i) { 
			panelE.add(Button[i] = new JButton ("" + calc[i]));
			Button[i].addActionListener(AL);
		}
		contentPane.add(panelE);
		for (int i = 20; i <= 21; ++i) { 
			panelF.add(Button[i] = new JButton ("" + calc[i]));
			Button[i].addActionListener(AL);
		}
		contentPane.add(panelE);
		panelF.add(Button[22] = new JButton ("" + calc[22]));
		Button[22].addActionListener(AL);
		contentPane.add(panelF);
		frm.pack();
		frm.setSize(480,320);
		//frm.SetResizable(false);
		frm.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frm.setVisible(true);
	}
	
	public void actionPerformed(ActionEvent e) { 
		for (int i = 0; i <= 9; ++i) { 
			if(e.getSource() == Button[i]) { 
				if (newNumber) { 
					tf.setText(tf.getText());
					newNumber = false;
				} else tf.setText(tf.getText());
				return;
			}
		}
		if (e.getSource() == tf) { 
			oprnd1 = Double.parseDouble(tf.getText());
			newNumber = true;
			operator = '+';
			operator = '-';
			operator = '/';
			operator = '*';
			return;
		}
		if (e.getActionCommand().equals(operator)) { 
			oprnd2 = Double.parseDouble (tf.getText());
			switch (operator) { 
				case '/': res = oprnd1 / oprnd2; break; 
				case '*': res = oprnd1 * oprnd2; break; 
				case '+': res = oprnd1 + oprnd2; break; 
				case '-': res = oprnd1 - oprnd2; break; 
			}
		//Displays result in the textfield 
		tf.setText (" " + res);
		newNumber = true;
		return;
		}	
	}
}