/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package webService;

import banksampahonline.database.BankSampahOnlineDB;
import banksampahonline.util.Account;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;

/**
 *
 * @author van
 */
@WebService(serviceName = "BankSampahOnlineUangVirtual")
public class BankSampahOnlineUangVirtual {

    BankSampahOnlineDB db;
    Account account;


    /**
     * Web service operation
     */
    @WebMethod(operationName = "withdrawUangVirtual")
    public boolean withdrawUangVirtual(@WebParam(name = "username") String username, @WebParam(name = "password") String password, @WebParam(name = "jumlah") double jumlah) {
        db = new BankSampahOnlineDB();
        return db.withDraw(username, password, jumlah);
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "getSaldo")
    public double getSaldo(@WebParam(name = "username") String username, @WebParam(name = "password") String password) {
        db = new BankSampahOnlineDB();
        return db.getSaldo(username, password);
    }
}
