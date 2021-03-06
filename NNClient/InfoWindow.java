import java.awt.*;
import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class InfoWindow extends JFrame
{
  public JLabel title;
  public JLabel cd;
  public JLabel lec;
  public JLabel codeLabel;
    /* code name appears */
  public JLabel classNameLabel;
    /* class name appears */
  public JLabel profNameLabel;
    /* Professor name appears */
  public JButton jjimButton;
    /* click => add to list */
  public JButton unjjimButton;
  
  //cd = code, lec = class name
  
  public InfoWindow(ActionListener buttonListener)
  {
    Container contentPane = getContentPane();
      contentPane.setBackground(Color.CYAN);
      
      title = new JLabel("너와 나의 연결강의");
      title.setHorizontalAlignment(SwingConstants.CENTER);
      title.setFont(title.getFont().deriveFont(20.0f));
      contentPane.add(title);
      title.setBounds(33, 61, 255, 44);
    
      cd = new JLabel("수업코드 : ");
      contentPane.add(cd);
      cd.setBounds(33, 145, 67, 41);
      
      codeLabel = new JLabel();
      contentPane.add(codeLabel);
      codeLabel.setBounds(108, 145, 180, 44);
      
      lec = new JLabel("수업이름 : ");
      contentPane.add(lec);
      lec.setBounds(33, 219, 67, 41);
      
      classNameLabel = new JLabel();
      contentPane.add(classNameLabel);
      classNameLabel.setBounds(108, 219, 180, 44);
      
      profNameLabel = new JLabel();
      contentPane.add(profNameLabel);
      profNameLabel.setBounds(108, 270, 180, 44);
      
      jjimButton = new JButton("찜하기");
      contentPane.add(jjimButton);
      jjimButton.setBounds(74, 338, 172, 55);
      jjimButton.addActionListener(buttonListener);
      
      unjjimButton = new JButton("찜 취소");
      contentPane.add(unjjimButton);
      unjjimButton.setBounds(74, 410, 172, 55);
      unjjimButton.addActionListener(buttonListener); 
  }
  
  public void showWindow()
  {
    setTitle("너와 나의 연결강의");
    setSize(320, 548);
    setLayout(null);
    setVisible(true);
    setResizable(false);
   // setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
  }

}

