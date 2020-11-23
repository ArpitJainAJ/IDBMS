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
public class Orders {
    int order_id;
    int customer_id;
    int seat_cover_id;
    int quality_id;
    int quantity;
    String Label;
    int status_id;
    Date date;
    String Packing_Type;
    String Comments;
    
    public Orders(int order_id, int customer_id, int seat_cover_id, int quantity, int quality_id, String Label, int status_id, Date date, String Packing_Type, String Comments)
    {
        this.order_id = order_id;
        this.customer_id = customer_id;
        this.seat_cover_id = seat_cover_id;
        this.quality_id = quality_id;
        this.quantity = quantity;
        this.Label = Label;
        this.status_id = status_id;
        this.date.setdate(date);
        this.Packing_Type = Packing_Type;
        this.Comments = Comments;
    }
}
