/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Company1;
import java.util.Date;
/**
 *
 * @author arpit
 */
public class Orders {
    String order_id;
    String seat_cover_id;
    String quality_id;
    String quantity;
    String Label;
    String status;
    String date;
    String Packing_Type;
    String Comments;
    String CustomerName;
    String customer_id;
    String Vehicle_Type;
    String quality;
    
    public Orders()
    {
        order_id = new String();
        seat_cover_id = new String();
        quality_id = new String();
        quantity = new String();
        Label = new String();
        status = new String();
        date = new String();
        Packing_Type = new String();
        Comments = new String();
        CustomerName = new String();
        customer_id = new String();
        Vehicle_Type = new String();
        quality = new String();
    }
    public boolean checkstatus()
    {
        if(("pending".equals(this.status)))
            return true;
        else if(("processed".equals(this.status)))
            return true;
        else if(("pompleted".equals(this.status)))
            return true;
        else if(("delivered".equals(this.status)))
            return true;
        else
            return false;
    }
}
