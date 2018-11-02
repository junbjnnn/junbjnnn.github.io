package fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.dao.ThongTinGiaDinhDAO;
import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.entity.ThongTinGiaDinh;

@Repository
public class ThongTinGiaDinhDAOImpl implements ThongTinGiaDinhDAO {
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void addThongTinGiaDinh(ThongTinGiaDinh ttgd) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(ttgd);
	}

	@Override
	public void updateThongTinGiaDinh(ThongTinGiaDinh ttgd) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(ttgd);
	}

	@Override
	public void deleteThongTinGiaDinh(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		ThongTinGiaDinh ttgd = (ThongTinGiaDinh) session.load(ThongTinGiaDinh.class, id);
		if (null != ttgd) {
			session.delete(ttgd);
		}
	}
}
