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
public class Quality {
    int quality_id;
    float Type;
    
    void Quality(int quality_id, float value)
    {
        this.quality_id = quality_id;
        this.Type = value;
    }
    void Quality (Quality q)
    {
        this.quality_id = q.quality_id;
        this.Type = q.Type;
    }
}
