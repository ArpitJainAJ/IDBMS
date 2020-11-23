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
public class Customers {
    int customer_id;
    String Name;
    String Address;
    String Mobile_Number;
    String Company_Name;
    String GST_NO;
    
    public Customers(int cid, String name, String address, String mobile_no, String company_name, String gst_no)
    {
        this.customer_id = cid;
        this.Name = name;
        this.Address = address;
        this.Mobile_Number = mobile_no;
        this.Company_Name = company_name;
        this.GST_NO = gst_no;
    }
}
