package fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.dao.ThongTinBangCapDAO;
import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.entity.ThongTinBangCap;

@Repository
public class ThongTinBangCapDAOImpl implements ThongTinBangCapDAO {
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void addThongTinBangCap(ThongTinBangCap ttbc) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(ttbc);
	}

	@Override
	public void updateThongTinBangCap(ThongTinBangCap ttbc) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(ttbc);
	}

	@Override
	public void deleteThongTinBangCap(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		ThongTinBangCap ttbc = (ThongTinBangCap) session.load(ThongTinBangCap.class, id);
		if (null != ttbc) {
			session.delete(ttbc);
		}
	}
}
