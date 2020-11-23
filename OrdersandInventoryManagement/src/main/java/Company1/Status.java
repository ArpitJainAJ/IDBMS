/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Company1;

/**
 *
 * @author arpit
 */
public class Status {
    int status_id;
    String status;
    
    public Status(int status_id, String status)
    {
        this.status_id = status_id;
        this.status = status;
    }
    public Status(Status s)
    {
        this.status_id = s.status_id;
        this.status = s.status;
    }
}
