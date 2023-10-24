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
	public void addProduct(int pnum, int oqty) throws Exception {
		ProdDAO pdao = ProdDAO.getInstance();
		ArrayList<ProdDTO>	lists= pdao.selectProdNum(pnum);
		ProdDTO pb =lists.get(0);
		boolean poqty = false;
		for(int i= 0 ; i<clist.size();i++) {
			int getpnum= clist.get(i).getPnum();
			if(pb.getPnum()==getpnum) {
				clist.get(i).setPqty(clist.get(i).getPqty()+1);
				poqty=true;
			}
		}
	if(!poqty) {
		clist.add(pb);
	}
	System.out.print(clist.size());
	}
	public Vector<ProdDTO> getAllProd() {
		
		return clist;
	}
	public void setEdit(int pnum,int oqpty)throws Exception {
		ProdDAO pdao =ProdDAO.getInstance();
		for(ProdDTO pb : clist) {
			if(oqpty==0) {
				clist.removeElement(pb);
				break;
			}
			else {
				pb.setPqty(oqpty);
			}
		}
				
	}
	public void delEdit(int pnum)throws Exception {
		for(ProdDTO pb : clist) {
			if(pb.getPnum()==pnum) {
				clist.removeElement(pb);
			}
		}
	}
	public void removeAllProducts() {
		clist.removeAllElements();
	}
}
