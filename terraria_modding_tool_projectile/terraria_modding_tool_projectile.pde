import javax.swing.*;
import java.awt.event.*;
import java.awt.*;
int aistyle=0;
boolean friendly=false;
boolean hostile=false;
int penetrate=-1;
int timeLeft;
String parseBool(boolean p) {
  if (p==true) {
    return "true";
  } else {
    return "false";
  }
}
void setup(){
JPanel[] x=new JPanel[10];
  for(int i=0;i<x.length;i++) x[i]=new JPanel();
  String data2[]={"Bullet","Arrows","Thrown (Shuriken)","Boomerang and Light Disks","Vilethorn","Falling Star","Powder","Grapple Hook","Bounce","Follows cursor","Falling","Water Stream (Aqua Sepucer)","Harpoon","Explosive","Tool (Not recomended)","No gravity (Notes)","Ice Block (not recomended)","Flames","Crystal shards"};
  final  JList list2 = new JList(data2);
  list2.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
  list2.setVisibleRowCount (3);
  list2.setLayoutOrientation(JList.VERTICAL);
  JScrollPane listScroller2 = new JScrollPane(list2);
  x[2].add(listScroller2);
  final JTextField modname=new JTextField(10);
  x[0].add(new JLabel("Modname:"));
  x[0].add(modname);

  final JTextField classname=new JTextField(10);
  x[1].add(new JLabel("Classname:"));
  x[1].add(classname);
  
  final JTextField damage=new JTextField(10);
  x[3].add(new JLabel("Damage (Optional):"));
  x[3].add(damage);
  
  final JTextField size=new JTextField(10);
  x[4].add(new JLabel("Size:"));
  x[4].add(size);
  final JTextField penetrate=new JTextField(10);
  x[4].add(new JLabel("How many enemies are Penetrated"));
  x[5].add(new JLabel("(-1 for infinite enemies):"));
  x[5].add(size);
  JButton run=new JButton("Add Projectile");
  x[x.length-1].add(run);
  
    final JCheckBox friendly_=new JCheckBox();
 
  friendly_.addActionListener(new ActionListener() {

    public void actionPerformed(ActionEvent e) {
      if (friendly==true) {
        friendly=false;
      } else {
        friendly=true;
      }
    }
  }
  );
  
  final JCheckBox hostile_=new JCheckBox();
 
  hostile_.addActionListener(new ActionListener() {

    public void actionPerformed(ActionEvent e) {
      if (hostile==true) {
        hostile=false;
      } else {
        hostile=true;
      }
    }
  }
  );
  x[6].add(new JLabel("Friendly:"));
  x[6].add(friendly_);
  x[6].add(new JLabel("Hostile:"));
  x[6].add(hostile_);
  final JTextField speed=new JTextField(10);
  x[7].add(new JLabel("Speed:"));
  x[7].add(speed);
  run.addActionListener(new ActionListener() {
    
    public void actionPerformed(ActionEvent e) {
      String name="";
    String[] words=classname.getText().split(" ");
    for(int i=0;i<words.length;i++) name+=words[i];
    String[] ins={"using System;\n using System.Collections.Generic;\n using Microsoft.Xna.Framework;\n using Terraria;\n using Terraria.ID;\n using Terraria.ModLoader;"};
      /*if (list.getSelectedIndex()==0) */{
        ins[0]+="\n namespace "+modname.getText()+"{ ";
        ins[0]+="\n public class  "+name+": ModProjectile{ ";
        ins[0]+=" \n public override void SetDefaults() { ";
        ins[0]+="\n projectile.aiStyle = "+(list2.getSelectedIndex())+";";
        ins[0]+="\n projectile.width = "+size.getText()+";";
        ins[0]+="\n projectile.height = "+size.getText()+";";
        ins[0]+="\n projectile.speed = "+speed.getText()+";";
        ins[0]+="\n projectile.friendly = "+parseBool(friendly)+";";
        ins[0]+="\n projectile.hostile = "+parseBool(hostile)+";";
        if (!penetrate.getText().equals("")) ins[0]+="\n projectile.penetrate = "+penetrate.getText()+";";
        if (!damage.getText().equals("")) ins[0]+="projectile.damage ="+damage.getText()+";";
        ins[0]+="\n }";
        ins[0]+="\n }";
        ins[0]+="\n }";
      }println(ins[0]);
      saveStrings(name+".cs",ins);
      ///list.getSelectedIndex()
    }
  }
  );
  
  
  
  JOptionPane.showOptionDialog(
    null, 
    x, 
    "Add Projectile", 
    JOptionPane.DEFAULT_OPTION, JOptionPane.PLAIN_MESSAGE, 
    null, 
    null, null);
}