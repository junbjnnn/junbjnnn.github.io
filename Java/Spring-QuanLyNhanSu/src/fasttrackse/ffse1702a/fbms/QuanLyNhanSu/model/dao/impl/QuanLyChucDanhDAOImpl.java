package fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.entity.ChucDanh;
import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.dao.QuanLyChucDanhDAO;

@Repository
public class QuanLyChucDanhDAOImpl implements QuanLyChucDanhDAO {

	@Autowired(required = true)
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<ChucDanh> listChucDanh() {
		Session session = this.sessionFactory.getCurrentSession();
		List<ChucDanh> chucdanhList = session.createQuery("from ChucDanh").list();
		return chucdanhList;
	}

	@Override
	public void addChucDanh(ChucDanh p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.save(p);
	}

	@Override
	public void updateChucDanh(ChucDanh p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(p);
	}

	@Override
	public ChucDanh getChucDanhByMa(String maChucDanh) {
		Session session = this.sessionFactory.getCurrentSession();
		ChucDanh p = (ChucDanh) session.get(ChucDanh.class, maChucDanh);
		return p;
	}
	
	@Override
	public void removeChucDanh(String maChucDanh) {
		Session session = this.sessionFactory.getCurrentSession();
		ChucDanh remove = (ChucDanh) session.load(ChucDanh.class, maChucDanh);
		if(null != remove) {
			session.delete(remove);
		}
	}
	
	@Override
	public boolean checkChucDanh(String maChucDanh) {

		if (maChucDanh != "") {
			Session session = this.sessionFactory.getCurrentSession();
			String result = session
					.createSQLQuery("SELECT COUNT(*) FROM `chuc_danh` WHERE `ma_chuc_danh` = '" + maChucDanh + "'")
					.getSingleResult().toString();

			return result.equals("0") ? true : false;
		}
		return true;
	}
}
