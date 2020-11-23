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
public class Date {
    int d;
    int m;
    int y;
    
    public Date(int d, int m, int y)
    {
        this.d = d;
        this.m = m;
        this.y = y;
    }
    public Date(Date x)
    {
        this.d = x.d;
        this.m = x.m;
        this.y = x.y;
    }
    
    public void setdate (Date x)
    {
        this.d = x.d;
        this.m = x.m;
        this.y = x.y;
    }
}
