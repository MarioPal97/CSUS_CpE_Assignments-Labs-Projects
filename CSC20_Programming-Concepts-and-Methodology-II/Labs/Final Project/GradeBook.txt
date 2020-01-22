///Mario Palacios CSC 20 - 01, Final Project 
import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.io.*;
class Course implements Serializable { int SSN; String Name; char Gender; int Age; int AcademicLvl; int Lab1; int Lab2; int Lab3; int Lab4; int Lab5; int Lab6; int Lab7; int Lab8; int Lab9; int Lab10; }  
public class GradeBook implements ActionListener {
	static String[] buttonM ={"Create a New Class", "Load Students From a File", "Add New Students", "Enter Lab Scores", "Sort Students", "View/Delete Students", "Backup Students to File", "Exit"};
	////////////////////////////////////////////////////////////////Box1 
	static JButton topButtons[] = new JButton[buttonM.length];
	static JScrollPane scrollPane;
	static JScrollPane scrollPane2; 
	static JTextField tf = new JTextField(" ", 10);
	static JTextField tf2 = new JTextField(" ", 10);
	
	////////////////////////////////////////////////////////////////Box2 
	static JTextField tf3 = new JTextField(" ", 10);
	static JButton box2A = new JButton();
	static JButton box2B = new JButton();
	
	////////////////////////////////////////////////////////////////Box3
	static JTextField tf5 = new JTextField(" ", 10);
	static JButton box3A = new JButton();
	static JButton box3B = new JButton();
	
	////////////////////////////////////////////////////////////////Box4
	static String[] info = {"ID", "Name", "Gender", "Age", "Academic Level", "Lab 1", "Lab 2", "Lab 3", "Lab 4", "Lab 5", "Lab 6", "Lab 7", "Lab 8", "Lab 9", "Lab 10"};
	static String[] sex = {"Male", "Female"};
	static String[] level = {"Freshman", "Sophmore", "Junior", "Senior"};
	static JComboBox <String> academic = new JComboBox <String>(level);
	static JComboBox <String> gender = new JComboBox <String>(sex);
	static JTextField tf6 = new JTextField(" ", 20);
	static JTextField tf7 = new JTextField(" ", 20);
	static JTextField tf8 = new JTextField(" ", 20);
	static JTextField tfA = new JTextField(" ", 20);
	static JTextField tfB = new JTextField(" ", 20);
	static JButton box4A = new JButton();
	static JButton box4B = new JButton();
	
	////////////////////////////////////////////////////////////////Box5
	static JTextField tf9 = new JTextField(" ", 20);
	static JTextField tf10 = new JTextField(" ", 20);
	static JTextField scoreFor = new JTextField();
	static JTextField labNum = new JTextField();
	static JButton box5A = new JButton();
	//static JButton box5B = new JButton();
	
	////////////////////////////////////////////////////////////////Box6
	static JButton box6A = new JButton();
	static JButton box6B = new JButton();
	
	////////////////////////////////////////////////////////////////Box7
	static JButton box7A = new JButton();
	static JButton box7B = new JButton();
	
	/////////////////////////////////////////////////////////////////
	
	static Course[] CS = new Course[100];
	static int cNum = 0;
	static double labs = 0;
	static int students = 0;
	static JTable abtable; 
	/////////////////////////////////////////////////////////////////
	
	static CardLayout contentPaneLayout;
	static Container contentPane;
	////////////////////////////////////////////////////////////////
	
	public void actionPerformed (ActionEvent e) { 
		Object source = e.getSource();
		for (int i = 0; i < 8; i++) { 
			if (source == topButtons[i]) { 
				switch(i) { 
				case 0: contentPaneLayout.show(contentPane, "Card 2");
				return;
				case 1: contentPaneLayout.show(contentPane, "Card 3");
				return;
				case 2: contentPaneLayout.show(contentPane, "Card 4");
				return;
				case 3: contentPaneLayout.show(contentPane, "Card 5");
				return;
				case 4: contentPaneLayout.show(contentPane, "Card 6");
				return; 
				case 5: 
					students = 0;
					String data[][] = new String[cNum][15];
					for (int j = 0; j < cNum; ++j) { 
						data[j][0] = " " + CS[j].SSN;
						data[j][1] = CS[j].Name;
						data[j][2] = sex[CS[j].Gender];
						data[j][3] = "" + CS[j].Age;
						data[j][4] = level[CS[j].AcademicLvl];
						if (CS[j].Lab1 == 5) {
							data[j][5] = "" + CS[j].Lab1;
						}
						if (CS[j].Lab2 == 6) {
							data[j][6] = "" + CS[j].Lab2;
						}
						if (CS[j].Lab3 == 7) {
							data[j][7] = "" + CS[j].Lab3;
						}
						if (CS[j].Lab4 == 8) {
							data[j][8] = "" + CS[j].Lab4;
						}
						if (CS[j].Lab5 == 9) {
							data[j][9] = "" + CS[j].Lab5;
						}
						if (CS[j].Lab6 == 10) {
							data[j][10] = "" + CS[j].Lab6;
						}
						if (CS[j].Lab7 == 11) {
							data[j][11] = "" + CS[j].Lab7;
						}
						if (CS[j].Lab8 == 12) {
							data[j][12] = "" + CS[j].Lab8;
						}
						if (CS[j].Lab9 == 13) {
							data[j][13] = "" + CS[j].Lab9;
						}
						if (CS[j].Lab10 == 14) {
							data[j][14] = "" + CS[j].Lab10;
						}
					}
					students++;
					abtable = new JTable (data, info);
					JScrollPane tmp = new JScrollPane(abtable);
					scrollPane2.setViewport(tmp.getViewport());
					contentPaneLayout.show(contentPane, "Card 7");
					return;
				case 6:
				try { 
					FileOutputStream fos = new FileOutputStream (tf.getText(), false);
					ObjectOutputStream oos = new ObjectOutputStream (fos);
					for (int k = 0; k < cNum; ++k) { 
						oos.writeObject(CS[k]);
					}
					oos.close(); 
				} 
				catch (FileNotFoundException ee){ 
					System.out.println(ee.toString());
				} 
				catch (IOException ee) { 
					ee.printStackTrace();
				} 
				return;
				case 7: 
				System.exit(0);
				}
			}
		}
		if (source == box3A) { 
			try { 
				FileInputStream fis = new FileInputStream (tf5.getText()); 
				ObjectInputStream ois = new ObjectInputStream(fis);
				cNum = 0;
				while (true) { 
					Course c = (Course) ois.readObject();
					CS[cNum++] = c; 
				}
			} catch (EOFException ee) { 
			} catch (Exception ee) { 
				ee.printStackTrace();
			}
		}
		if (source == box2B || source == box3B || source == box4B || source == box5A || source == box6B || source == box7B) { 
			contentPaneLayout.show(contentPane, "Card 1");
			return;
		}
		if (source == box2A) { 
			tf.setText(tf3.getText());
			Course c = new Course();
			
			CS[0] = c; 
			cNum = 1;
			contentPaneLayout.show(contentPane, "Card 1");
		}
		if (source == box4A) { 
			Course c = new Course(); 
			c.SSN = (int)Double.parseDouble(tf6.getText());
			c.Name = tf7.getText();
			c.Gender = (char)gender.getSelectedIndex();
			c.Age = (int)Double.parseDouble(tf8.getText());
			c.AcademicLvl = academic.getSelectedIndex();
			CS[cNum++] = c;
			tf6.setText(" ");
			tf7.setText(" ");
			tf8.setText(" ");
			return;
		}
		if (source == box5A) {			//FOR ENTERING LAB SCORES
			Course c = new Course();
			labs = Integer.valueOf(scoreFor.getText()).intValue();
			//for (int i = 5; i <= 14; i++) { 
				//switch (i) { 
					//case 1: 
				//}
		}
		if (source == box7A) { 
			int d = abtable.getSelectedRow();
			for (int i = d + 1; i < cNum; ++i) { 
				CS[i - 1] = CS [i];
			}
			cNum--;
			students = 0;
			String data[][] = new String[cNum][15];
			for (int j = 0; j < cNum; ++j) { 
				data[j][0] = " " + CS[j].SSN;
				data[j][1] = CS[j].Name;
				data[j][2] = sex[CS[j].Gender];
				data[j][3] = " " + CS[j].Age;
				data[j][4] = level[CS[j].AcademicLvl];
				if (CS[j].Lab1 == 5) {
					data[j][5] = "" + CS[j].Lab1;
				}
				if (CS[j].Lab2 == 6) {
					data[j][6] = "" + CS[j].Lab2;
				}
				if (CS[j].Lab3 == 7) {
					data[j][7] = "" + CS[j].Lab3;
				}
				if (CS[j].Lab4 == 8) {
					data[j][8] = "" + CS[j].Lab4;
				}
				if (CS[j].Lab5 == 9) {
					data[j][9] = "" + CS[j].Lab5;
				}
				if (CS[j].Lab6 == 10) {
					data[j][10] = "" + CS[j].Lab6;
				}
				if (CS[j].Lab7 == 11) {
					data[j][11] = "" + CS[j].Lab7;
				}
				if (CS[j].Lab8 == 12) {
					data[j][12] = "" + CS[j].Lab8;
				}
				if (CS[j].Lab9 == 13) {
					data[j][13] = "" + CS[j].Lab9;
				}
				if (CS[j].Lab10 == 14) {
					data[j][14] = "" + CS[j].Lab10;
				}
			}
			students--;
			abtable = new JTable (data, info);
			JScrollPane tmp = new JScrollPane(abtable);
			scrollPane2.setViewport(tmp.getViewport());
			return;
		}
		if (source == box3A) { 
			try { 
				FileInputStream fis = new FileInputStream (tf5.getText());
				ObjectInputStream ois = new ObjectInputStream(fis);
				cNum = 0;
				labs = 0;
				while (true) { 
					Course C = (Course) ois.readObject();
					CS[cNum++] = C;
				}
			} catch (EOFException ee) { 
				} catch (Exception ee) { 
					ee.printStackTrace();
				}
			tf.setText(tf5.getText());
			tf2.setText(" " + labs);
			contentPaneLayout.show(contentPane, "Card 1");
			return; 
		}
	}
	public static void main (String[] args) {
		ActionListener AL = new GradeBook();
		JFrame frame = new JFrame ("GradeBook");
		
		//////////////////////////////////////////////////////////////////////////////////////////////Labels 
		JLabel titleA = new JLabel ("<html><font size = 5><b>Use Buttons Below to Manage Students</b></html>", JLabel.CENTER); 
		JLabel titleB = new JLabel ("<html><font size = 5><b>Create a New Class</b></html>", JLabel.CENTER);
		JLabel titleC = new JLabel ("<html><font size = 5><b>Load Students From a File</b></html>", JLabel.CENTER);
		JLabel titleD = new JLabel ("<html><font size = 5><b>Enter Student Information</b></html>", JLabel.CENTER);
		JLabel titleE = new JLabel ("<html><font size = 5><b>Enter Lab Scores</b></html>", JLabel.CENTER);
		JLabel titleF = new JLabel ("<html><font size = 5><b>Sort Students</b></html>", JLabel.CENTER);
		JLabel titleG = new JLabel ("<html><font size = 5><b>Student List</b></html>", JLabel.CENTER);
		
		//////////////////////////////////////////////////////////////////Box1
		contentPane = frame.getContentPane();
		contentPane.setLayout(contentPaneLayout = new CardLayout());
		JPanel box1 = new JPanel (new BorderLayout (0,1));
		box1.add(titleA,BorderLayout.NORTH);
		JPanel panelB = new JPanel (new GridLayout (2,4));
		JPanel panelC = new JPanel (new FlowLayout());
		JLabel labelB = new JLabel ("Class Name :", JLabel.CENTER);
		JLabel labelC = new JLabel ("Number of Students :", JLabel.CENTER);
		panelC.add(labelB);
		panelC.add(tf);
		panelC.add(labelC);
		panelC.add(tf2);
		
		/////////////////////////////////////////////////////////////ActionListeners
		for (int i = 0; i < buttonM.length; ++i) { 
			panelB.add(topButtons[i] = new JButton(" " + buttonM[i]));
			topButtons[i].addActionListener(AL);
		}
		box1.add(panelC, BorderLayout.CENTER);
		box1.add(panelB, BorderLayout.SOUTH);
		contentPane.add("Card 1", box1);
		
		///////////////////////////////////////////////////////////////Box2
		JPanel box2 = new JPanel(new GridLayout(0,1));
		JLabel labelD = new JLabel ("Class Name :", JLabel.CENTER);
		JPanel panelD = new JPanel (new FlowLayout());
		JPanel panelE = new JPanel (new GridLayout(0,2));
		JPanel panel1 = new JPanel();
		JPanel panel2 = new JPanel(new FlowLayout());
		box2.add(titleB,panelD);
		panelD.add(labelD);
		panelD.add(tf3);
		box2.add(panelD);
		box2.add(panel1);
		box2.add(panel2);
		panelE.add(box2A = new JButton("Create"));
		box2A.addActionListener(AL);
		panelE.add(box2B = new JButton("Cancel"));
		box2B.addActionListener(AL);
		box2.add(panelE);
		contentPane.add("Card 2", box2);
		
		/////////////////////////////////////////////////////////////Box 3
		JPanel box3 = new JPanel(new BorderLayout(0,1));
		box3.add(titleC,BorderLayout.NORTH);
		JLabel labelF = new JLabel ("Class Name :", JLabel.CENTER);
		JPanel panelF = new JPanel (new FlowLayout());
		JPanel panelG = new JPanel (new GridLayout(0,2));
		panelF.add(labelF);
		panelF.add(tf5);
		box3.add(panelF, BorderLayout.CENTER);
		panelG.add(box3A = new JButton ("Load"));
		box3A.addActionListener(AL);
		panelG.add(box3B = new JButton ("Cancel"));
		box3B.addActionListener(AL);
		box3.add(panelG, BorderLayout.SOUTH);
		contentPane.add("Card 3", box3);
		
		/////////////////////////////////////////////////////////////Box4
		JPanel box4 = new JPanel (new BorderLayout());
		JPanel panelH = new JPanel (new GridLayout (0,2));
		JPanel panelI = new JPanel (new GridLayout (0,2));
		JLabel labelG = new JLabel ("ID :", JLabel.RIGHT);
		JLabel labelH = new JLabel ("Name :", JLabel.RIGHT);
		JLabel labelI = new JLabel ("Gender :", JLabel.RIGHT);
		JLabel labelJ = new JLabel ("Age :", JLabel.RIGHT);
		JLabel labelK = new JLabel ("Academic Level :", JLabel.RIGHT);
		JPanel panel4 = new JPanel();
		JPanel panel5 = new JPanel(); 
		
		panelH.add(labelG);
		panelH.add(tf6);
		panelH.add(labelH);
		panelH.add(tf7);
		panelH.add(labelI);
		panelH.add(gender);
		panelH.add(labelJ);
		panelH.add(tf8);
		panelH.add(labelK);
		panelH.add(academic);
		panelI.add(box4A = new JButton ("Save & Add Student"));
		box4A.addActionListener(AL);
		panelI.add(box4B = new JButton ("Back to Top Menu"));
		box4B.addActionListener(AL);
		box4.add(panelH, BorderLayout.CENTER);
		box4.add(panelI, BorderLayout.SOUTH);
		contentPane.add("Card 4", box4);
		
		/////////////////////////////////////////////////////////////Box5		
		JPanel box5 = new JPanel (new BorderLayout(0,1));
		JPanel panel20 = new JPanel (new GridLayout (0,1));
		JPanel panel21 = new JPanel (new FlowLayout());
		JPanel panel22 = new JPanel (new FlowLayout());
		JLabel labelL = new JLabel ("Lab Number :", JLabel.CENTER);
		labNum = new JTextField(5);
		labNum.addActionListener(AL);
		JLabel labelM = new JLabel ("Score for :", JLabel.CENTER);
		scoreFor = new JTextField(10);
		scoreFor.addActionListener(AL);
		panel22.add(labelL);
		panel22.add(labNum);
		panel22.add(labelM);
		panel22.add(scoreFor);
		panel20.add(panel22);
		
		panel21.add(box5A = new JButton ("Back to Top Menu"));
		box5A.addActionListener(AL);
		panel20.add(panel21);
		scrollPane = new JScrollPane();
		box5.add(titleE, BorderLayout.NORTH);
		box5.add(scrollPane, BorderLayout.CENTER);
		box5.add(panel20, BorderLayout.SOUTH);
		contentPane.add("Card 5", box5);
		
		/////////////////////////////////////////////////////////////Box6
		JPanel box6 = new JPanel (new BorderLayout(0,1));
		JPanel panel23 = new JPanel (new FlowLayout());
		JPanel panel24 = new JPanel (new GridLayout(0,2));
		JRadioButton sort = new JRadioButton ("By ID");
		JRadioButton sort2 = new JRadioButton ("By Name");
		panel23.add(sort);
		panel23.add(sort2);
		panel24.add(box6A = new JButton ("Sort"));
		box6A.addActionListener(AL);
		panel24.add(box6B = new JButton ("Top Menu"));
		box6B.addActionListener(AL);
		box6.add(titleF, BorderLayout.NORTH);
		box6.add(panel23, BorderLayout.CENTER);
		box6.add(panel24, BorderLayout.SOUTH);
		contentPane.add("Card 6", box6);
		
		/////////////////////////////////////////////////////////////Box7
		String[] info2 = {"ID", "Name", "Level", "Gender", "Age", "Lab"};
		JPanel box7 = new JPanel (new BorderLayout (0,1));
		JPanel panel25 = new JPanel (new GridLayout (0,1));
		JPanel panel26 = new JPanel (new FlowLayout());
		JPanel panel27 = new JPanel (new FlowLayout());
		box7.add(titleG, BorderLayout.NORTH);
		scrollPane2 = new JScrollPane();
		box7.add(scrollPane2, BorderLayout.CENTER);
		panel26.add(box7A = new JButton ("Delete Selected"));
		box7A.addActionListener(AL);
		panel26.add(box7B = new JButton ("Top Menu"));
		box7B.addActionListener(AL);
		box7.add(panel26, BorderLayout.SOUTH);
		contentPane.add("Card 7", box7);
		
		////////////////////////////////////////////////////////////////EXIT
		contentPaneLayout.show(contentPane, "Card 1");
		frame.pack();
		frame.setSize(718,320);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setVisible(true);
	}
}