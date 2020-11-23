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
public class Inventory {
    int seat_cover_id;
    int quantity;
    int quanlity_id;
    
    public Inventory(int seat_cover_id, int quantity, int quality_id)
    {
        this.seat_cover_id = seat_cover_id;
        this.quantity = quantity;
        this.quanlity_id = quality_id;
    }
}
