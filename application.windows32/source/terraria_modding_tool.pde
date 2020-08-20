import javax.swing.*;
import java.awt.event.*;
import java.awt.*;
boolean autoswing_=false;
boolean staff=false;
String tooltip="";
boolean magic=false;
boolean melee=false;
boolean ranged=false;
boolean moddedammo=false;
int mana=0;
int value=0;
int useAnimation=3;
int useStyle=0;
int projectilespeed=0;
int useTime=0;
 boolean tempmod=false;
boolean moddedprojectile=false;
String projectile="";
int damage=0;
boolean gun_=false;
boolean bow_=false;
String parseBool(boolean p) {
  if (p==true) {
    return "true";
  } else {
    return "false";
  }
}
void setup() {
  String options[]={"Melee", "Ranged", "Magic"};
  /*String add=(String) JOptionPane.showInputDialog(null, "Add", 
   "Choose what to add", JOptionPane.QUESTION_MESSAGE, null, // Use
   // default
   // icon
   options, // Array of choices
   options[1]);*/

  final String[] ins={"using System;\n using System.Collections.Generic;\n using Microsoft.Xna.Framework;\n using Terraria;\n using Terraria.ID;\n using Terraria.ModLoader;"};

  //if (add.equals("Melee")) {
  JPanel[] x=new JPanel[22];
  for(int i=0;i<x.length;i++) x[i]=new JPanel();
  /*String data[]={"Weapon"};
  final  JList list = new JList(data);
  list.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
  list.setVisibleRowCount (3);
  list.setLayoutOrientation(JList.VERTICAL);
  
  JScrollPane listScroller = new JScrollPane(list);
  */
  /* JScrollPane scroll = new JScrollPane (list, 
   JScrollPane.VERTICAL_SCROLLBAR_ALWAYS, JScrollPane.HORIZONTAL_SCROLLBAR_ALWAYS);
   scroll. setVerticalScrollBarPolicy( JScrollPane. VERTICAL_SCROLLBAR_ALWAYS );*/
  //list.setPreferredSize(new Dimension(30, 50));
 /* x[2].add(new JLabel("Type:"));
  x[2].add(listScroller);*/

  JButton run=new JButton("Add Item");
  final JTextField modname=new JTextField(10);
  x[0].add(new JLabel("Modname:"));
  x[0].add(modname);

  final JTextField classname=new JTextField(10);
  x[1].add(new JLabel("Classname:"));
  x[1].add(classname);

  final JTextField damage_=new JTextField(10);
  x[1].add(new JLabel("Damage:"));
  x[1].add(damage_);
  
  
  final JCheckBox autoswing=new JCheckBox();
  autoswing.addActionListener(new ActionListener() {

    public void actionPerformed(ActionEvent e) {
      if (autoswing_==true) {
        autoswing_=false;
      } else {
        autoswing_=true;
      }
    }
  }
  );
  final JCheckBox gun=new JCheckBox();
  autoswing.addActionListener(new ActionListener() {

    public void actionPerformed(ActionEvent e) {
      if (gun_==true) {
        gun_=false;
      } else {
        gun_=true;
      }
    }
  }
  );
  x[3].add(new JLabel("Gun:"));
  x[3].add(gun);
  final JCheckBox bow=new JCheckBox();
  autoswing.addActionListener(new ActionListener() {

    public void actionPerformed(ActionEvent e) {
      if (bow_==true) {
        bow_=false;
      } else {
        bow_=true;
      }
    }
  }
  );
  
  x[3].add(new JLabel("Bow:"));
  x[3].add(bow);
  final JCheckBox ranged_=new JCheckBox();
  autoswing.addActionListener(new ActionListener() {

    public void actionPerformed(ActionEvent e) {
      if (ranged==true) {
        ranged=false;
      } else {
        ranged=true;
      }
    }
  }
  );
  x[4].add(new JLabel("Ranged:"));
  x[4].add(ranged_);
  final JCheckBox staff_=new JCheckBox();
  staff_.addActionListener(new ActionListener() {

    public void actionPerformed(ActionEvent e) {
      if (staff==true) {
        staff=false;
      } else {
        staff=true;
      }
    }
  }
  );
  x[3].add(new JLabel("Staff:"));
  x[3].add(staff_);
  final JCheckBox moddedamo_=new JCheckBox();
  moddedamo_.addActionListener(new ActionListener() {

    public void actionPerformed(ActionEvent e) {
      if (moddedammo==true) {
        moddedammo=false;
      } else {
        moddedammo=true;
      }
    }
  }
  );
  final JTextField ammo_=new JTextField(10);
  x[20].add(new JLabel("AmmoID:"));
  x[20].add(ammo_);
  x[20].add(new JLabel("Modded Item:"));
  x[20].add(moddedamo_);
  final JCheckBox melee_=new JCheckBox();
  melee_.addActionListener(new ActionListener() {

    public void actionPerformed(ActionEvent e) {
      if (melee==true) {
        melee=false;
      } else {
        melee=true;
      }
    }
  }
  );
  x[4].add(new JLabel("Melee:"));
  x[4].add(melee_);
  
  final JCheckBox magic_=new JCheckBox();
  magic_.addActionListener(new ActionListener() {

    public void actionPerformed(ActionEvent e) {
      if (magic==true) {
        magic=false;
      } else {
        magic=true;
      }
    }
  }
  );
  x[4].add(new JLabel("Magic:"));
  x[4].add(magic_);
  
  final JTextField mana_=new JTextField(10);
  x[6].add(new JLabel("Mana:"));
  x[6].add(mana_);
  
  final JTextField value_=new JTextField(15);
  x[7].add(new JLabel("Value (in Copper):"));
  x[7].add(value_);
  
  String data2[]={"Swing/Throw","Eat (Please No)","Stabbing","Hold up","Hold out"};
  final  JList list2 = new JList(data2);
  list2.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
  list2.setVisibleRowCount (3);
  list2.setLayoutOrientation(JList.VERTICAL);
  JScrollPane listScroller2 = new JScrollPane(list2);
  x[8].add(listScroller2);
  
  final JTextField useTime_=new JTextField(10);
  x[9].add(new JLabel("How fast it should be used:"));
  x[9].add(useTime_);
  
  final JTextField tooltip_=new JTextField(10);
  x[5].add(new JLabel("Tooltip:"));
  x[5].add(tooltip_);
  
  final JTextField size_=new JTextField(10);
  x[10].add(new JLabel("Size:"));
  x[10].add(size_);
  
  final JCheckBox moddedprojectile_=new JCheckBox();
  moddedprojectile_.addActionListener(new ActionListener() {

    public void actionPerformed(ActionEvent e) {
      if (moddedprojectile==true) {
        moddedprojectile=false;
      } else {
        moddedprojectile=true;
      }
    }
  }
  );
  x[11].add(new JLabel("Modded projectile:"));
  x[11].add(moddedprojectile_);
  
  final JTextField projectile_=new JTextField(10);
  x[12].add(new JLabel("Projectile:"));
  x[12].add(projectile_);
  
  final DefaultListModel listModel = new DefaultListModel();
  final  JList list3 = new JList(listModel);
  list3.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
  list3.setVisibleRowCount (3);
  list3.setLayoutOrientation(JList.VERTICAL);
  JScrollPane listScroller3 = new JScrollPane(list3);
  x[14].add(listScroller3);
  
  final JCheckBox moddedit_=new JCheckBox();
 
  moddedit_.addActionListener(new ActionListener() {

    public void actionPerformed(ActionEvent e) {
      if (tempmod==true) {
        tempmod=false;
      } else {
        tempmod=true;
      }
    }
  }
  );
  x[15].add(new JLabel("Moddeditem:"));
  x[15].add(moddedit_);
  
  final JTextField count_=new JTextField(5);
  x[15].add(new JLabel("Count:"));
  x[15].add(count_);
  
  final JTextField item_=new JTextField(5);
  x[15].add(new JLabel("Item:"));
  x[15].add(item_);
  
  final JButton addtor_=new JButton("Add to recipy");
 
  addtor_.addActionListener(new ActionListener() {

    public void actionPerformed(ActionEvent e) {
      if(tempmod==true){
      listModel.insertElementAt("Modded, "+item_.getText()+", "+count_.getText(), 0);}else{
      listModel.insertElementAt("Vanilla, "+item_.getText()+", "+count_.getText(), 0);}
      item_.setText("");
    }
  }
  );
  final JButton tremovetor_=new JButton("Remove from recipy");
 
  tremovetor_.addActionListener(new ActionListener() {

    public void actionPerformed(ActionEvent e) {
      println(list3.getSelectedIndex());
      listModel.remove(list3.getSelectedIndex());
    }
  }
  );
  x[16].add(tremovetor_);
  x[16].add(addtor_);
  final JTextField station_=new JTextField(5);
  x[17].add(new JLabel("Craftingstation:"));
  x[17].add(station_);
  run.addActionListener(new ActionListener() {
    
    public void actionPerformed(ActionEvent e) {
      String name="";
    String[] words=classname.getText().split(" ");
    for(int i=0;i<words.length;i++) name+=words[i];
      /*if (list.getSelectedIndex()==0) */{
        ins[0]+="\n namespace "+modname.getText()+"{ ";
        ins[0]+="\n public class  "+name+": ModItem{ ";
        ins[0]+=" \n public override void SetStaticDefaults() { ";
        ins[0]+="\n Tooltip.SetDefault(\""+tooltip_.getText()+"\");";
        if (staff==true) ins[0]+="\n Item.staff[item.type] = true;";
        ins[0]+="\n }";
        ins[0]+=" \n public override void SetDefaults() { ";
        ins[0]+="\n item.damage = "+damage_.getText()+";";
        ins[0]+="\n item.magic = "+parseBool(magic)+";";
        ins[0]+="\n item.melee = "+parseBool(melee)+";";
        ins[0]+="\n item.ranged = "+parseBool(ranged)+";";
        if(gun_==true) ins[0]+="\n item.useAmmo = AmmoID.Bullet;";
        if(bow_==true) ins[0]+="\n item.useAmmo = AmmoID.Arrow;";
        if(!mana_.getText().equals("")) ins[0]+="\n item.mana = "+mana_.getText()+";";
        ins[0]+="\n item.value = "+value_.getText()+";";
        ins[0]+="\n item.useAnimation = "+useAnimation+";";
        ins[0]+="\n item.useStyle = "+(list2.getSelectedIndex()+1)+";";
        ins[0]+="\n item.useTime = "+useTime_.getText()+";";
        ins[0]+="\n item.shootSpeed = "+projectilespeed+";";
        ins[0]+="\n item.width = "+size_.getText()+";";
        ins[0]+="\n item.height = "+size_.getText()+";";
        //moddedamo_
        if (!projectile.equals("")) {
          if (moddedprojectile==true) {
            ins[0]+="\n item.shoot=mod.ProjectileType(\""+projectile_.getText()+"\");";
          } else {
            ins[0]+="\n item.shoot = ProjectileID."+projectile_.getText()+";";
          }
        }
        if (!ammo_.getText().equals("")) {
          if (moddedammo==true) {
            ins[0]+="\n item.useAmmo=mod.ModContent.ItemType<\""+ammo_.getText()+"\">();";
          } else {
            ins[0]+="\n item.useAmmo = ItemID."+ammo_.getText()+";";
          }
        }
        ins[0]+="\n }";
        ins[0]+=" \n public override void AddRecipes() { ";
        ins[0]+="\n ModRecipe recipe = new ModRecipe(mod);";
        for(int i=0;i<listModel.getSize();i++) {
        String get[]=((String) listModel.get(i)).split(",");
        if(get[0].equals("Modded")) {
        
        ins[0]+="\n recipe.AddIngredient(ModContent.ItemType<"+get[2]+">(),"+get[1]+");";
        }else{
        ins[0]+="\n recipe.AddIngredient(ItemID."+get[2]+","+get[1]+");";}
        }
        /*
      recipe.SetResult(this);
      recipe.AddRecipe();*/
        ins[0]+="\n recipe.SetResult(this);";
        ins[0]+="\n recipe.AddRecipe();";
        ins[0]+="\n }";
        ins[0]+="\n }";
        ins[0]+="\n }";
      }println(ins[0]);
      ///list.getSelectedIndex()
    }
  }
  );
  x[x.length-1].add(run);
  JOptionPane.showOptionDialog(
    null, 
    x, 
    "Add ", 
    JOptionPane.DEFAULT_OPTION, JOptionPane.PLAIN_MESSAGE, 
    null, 
    null, null);
  //}
  }
void toggleAutoswing() {
  autoswing_=!autoswing_;
}
void toggleStaff() {

  staff=!staff;
}
void setTooltip(String t) {
  tooltip=t;
}