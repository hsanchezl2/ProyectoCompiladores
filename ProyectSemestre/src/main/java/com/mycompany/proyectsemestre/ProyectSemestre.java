/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Project/Maven2/JavaApp/src/main/java/${packagePath}/${mainClassName}.java to edit this template
 */

package com.mycompany.proyectsemestre;

import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import jflex.Main;

/**
 *
 * @author PC
 */
public class ProyectSemestre {

    public static void main(String[] args) throws FileNotFoundException  {
// TODO code application logic here
          try {
        FileWriter fileWriter = new FileWriter("output.py");
        fileWriter.close();
        } catch (IOException ex) {
            Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
        }    
   
    }   

}
