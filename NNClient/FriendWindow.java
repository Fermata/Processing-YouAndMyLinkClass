import java.awt.*;
import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class FriendWindow extends JFrame
{
  public JLabel title ;
  public JLabel friendNameLabel;
    /* one's name */
  public JLabel similarityLabel;
    /* x % appears */
  public JButton[] jjimButton;
    /* list appears */
  
  public FriendWindow(ActionListener buttonListener)
  {
    Container contentPane = getContentPane();
      contentPane.setBackground(Color.CYAN);
      
      title = new JLabel("너와 나의 연결강의");
      title.setHorizontalAlignment(SwingConstants.CENTER);
      title.setFont(title.getFont().deriveFont(20.0f));
      contentPane.add(title);
      title.setBounds(33, 61, 255, 44);
      
      friendNameLabel = new JLabel();
      friendNameLabel.setHorizontalAlignment(SwingConstants.CENTER);
      friendNameLabel.setFont(friendNameLabel.getFont().deriveFont(16.0f));
      contentPane.add(friendNameLabel);
      friendNameLabel.setBounds(74, 140, 173,45);
      
      similarityLabel = new JLabel();
      similarityLabel.setHorizontalAlignment(SwingConstants.CENTER);
      similarityLabel.setFont(similarityLabel.getFont().deriveFont(14.0f));
      contentPane.add(similarityLabel);
      similarityLabel.setBounds(47, 262, 227, 58);
      
      jjimButton  = new JButton[6];
    for(int i=0; i<jjimButton.length; i++)
      {
      jjimButton[i] = new JButton("jjim "+(i+1));
      contentPane.add(jjimButton[i]);
      jjimButton[i].addActionListener(buttonListener);
      }
    jjimButton[0].setBounds(12, 362, 95, 73);
    jjimButton[1].setBounds(113, 362, 95, 73);
    jjimButton[2].setBounds(213, 362, 95, 73);
    jjimButton[3].setBounds(12, 442, 95, 73);
    jjimButton[4].setBounds(113, 442, 95, 73);
    jjimButton[5].setBounds(213, 442, 95, 73);
  }
  
  public void showWindow()
  {
    setTitle("너와 나의 연결강의");
    setSize(320, 548);
    setLayout(null);
    setVisible(true);
    setResizable(false);
    //setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
  }
}

