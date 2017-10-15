/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;
import models.Comment;
import models.Comments;
import models.Entry;

/**
 *
 * @author Max
 */
public class CommentController implements Serializable{
    private String filePath;
    private Comments comments;

    public CommentController() {
    }

    /**
     * The constructor for the Login Controller
     * 
     * @param filePath The filepath to store the login details (users.xml)
     * @param users The user which has this login details
     */
    public CommentController(String filePath, Comments comments) {
        super();
        this.filePath = filePath;
        this.comments = comments;
    }
    
    /**
     * Perform initial retrieval of data from the comments.xml file
     * 
     * @param filePath The filepath to comments.xml
     * @throws Exception 
     */
    public void setFilePath(String filePath) throws Exception{
        this.filePath = filePath;
        
        // Sets up the helper classes
        JAXBContext jc = JAXBContext.newInstance(Comments.class);
        Unmarshaller u = jc.createUnmarshaller();
        
        // Streams the xml file into the users object
        FileInputStream fin = new FileInputStream(filePath);
        comments = (Comments) u.unmarshal(fin);
        fin.close();
    }
    
    /**
     * Explicit form of saving user data; used when the application hasn't been set up
     * 
     * @param comments The collection of comment data to be persisted
     * @param filePath The path to the comments.xml file
     * @throws Exception 
     */
    public void updateXML(Comments comments, String filePath) throws Exception{
        this.comments = comments;
        this.filePath = filePath;
        
        // Sets up the helper classes
        JAXBContext jc = JAXBContext.newInstance(Comments.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        
        // Streams the user data into the xml file
        FileOutputStream fout = new FileOutputStream(filePath);
        m.marshal(comments, fout);
        fout.close();
    }
    
    /**
     * Less explicit way of saving the user data to the users.xml file
     * 
     * @throws JAXBException
     * @throws IOException 
     */
    public void saveUsers() throws JAXBException, IOException{
        // Sets up helper classes
        JAXBContext jc = JAXBContext.newInstance(Comments.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        
        // Streams the user data into the xml file
        FileOutputStream fout = new FileOutputStream(filePath);
        m.marshal(comments, fout);
        fout.close();
    }
    
    public void addComment(Comment comment){
        comments.add(comment);
    }

    public Comments getComments() {
        return comments;
    }

    public void setComments(Comments comments) {
        this.comments = comments;
    }
    
    /**
     *
     * @return List of associated comments
     */
    public Comments getCommentsByEntry(int userID, int journalID, int entryID){
        Comments entriesComments = new Comments();
        
        for(Comment c : comments.getComments()){
            if(userID == c.getUserID()){
                if (journalID == c.getJournalID()) {
                    if (entryID == c.getEntryID()) {
                        entriesComments.add(c);
                    }
                }
            }
        }
        return entriesComments;
    }
    
    public int getNewCommentID(ArrayList<Comment> comments){
        if(comments.size() > 0){
            int max = 0;
            for(Comment c : comments){
                if(c.getCommentID() > max){
                    max = c.getCommentID();
                }
            }
            return max + 1;
        }
        else{
            return 1;
        }
    }
}