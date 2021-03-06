import java.awt.*;
import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

class LoginWindow extends JFrame
{
  public JLabel title ;
    /* title input */
  public JLabel id;
  public JLabel pw;
  public JTextField idField;
    /* ID input */
  public JPasswordField passwordField;
    /* PW input */
  public JButton loginButton;
    /* click => SearchWindow */
  public JButton joinButton;
    /* click => JoinWindow */
    
  public LoginWindow(ActionListener buttonListener)
  {
    Container contentPane = getContentPane();
      contentPane.setBackground(Color.CYAN);
      
      title = new JLabel("너와 나의 연결강의");
      title.setHorizontalAlignment(SwingConstants.CENTER);
      title.setFont(title.getFont().deriveFont(20.0f));
      contentPane.add(title);
      title.setBounds(33, 61, 255, 44);
      
      id = new JLabel("ID : ");
      contentPane.add(id);
      id.setBounds(33, 175, 67, 41);
      
      idField = new JTextField();
      contentPane.add(idField);
      idField.setBounds(121, 175, 167, 44);
      
      pw = new JLabel("PW : ");
      contentPane.add(pw);
      pw.setBounds(33, 254, 67, 41);
      
      passwordField = new JPasswordField();
      contentPane.add(passwordField);
      passwordField.setBounds(121, 252, 167, 44);
      
      loginButton = new JButton("LOGIN");
      contentPane.add(loginButton);
      loginButton.setBounds(171, 351, 117, 55);
      loginButton.addActionListener(buttonListener);
    
      joinButton = new JButton("JOIN");
      contentPane.add(joinButton);
      joinButton.setBounds(33, 351, 117, 55);
      joinButton.addActionListener(buttonListener);      
  }

  public void showWindow()
  {
    setTitle("너와 나의 연결강의");
    setSize(320, 548);
    setLayout(null);
    setVisible(true);
    setResizable(false);
    setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
  }

}

