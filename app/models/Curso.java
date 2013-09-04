package models;

import java.util.*;

import javax.persistence.*;

import play.db.ebean.*;
import play.data.format.*;
import play.data.validation.*;

/**
 * Computer entity managed by Ebean
 */
@SuppressWarnings("serial")
@Entity 
public class Curso extends Model {

    @Id
    public Long id;
    
    @Constraints.Required
    public String nombre;
    
    /**
     * Generic query helper for entity Computer with id Long
     */
    public static Finder<Long,Curso> find = new Finder<Long,Curso>(Long.class, Curso.class); 
    
    /**
     */
    public static List<Curso> all() {
        return find.orderBy("nombre").findList();
    }
    
}

