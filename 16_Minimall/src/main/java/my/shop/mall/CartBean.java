package my.shop.mall;

import java.util.ArrayList;
import java.util.Vector;

import my.prod.ProdDAO;
import my.prod.ProdDTO;

public class CartBean {
	private Vector<ProdDTO> clist;
	
	public CartBean() {
	clist= new Vector<ProdDTO>();
	}
	public void addProduct(int pnum, int ovaule) throws Exception {
		ProdDAO pdao = ProdDAO.getInstance();
		ArrayList<ProdDTO>	lists= pdao.selectProdNum(pnum);
		ProdDTO pb =lists.get(0);
		pb.setPqty(ovaule);
		clist.add(pb);
	 	System.out.print(clist.size());
	}
	public Vector<ProdDTO> getAllProd() {
		
		return clist;
	}
}
