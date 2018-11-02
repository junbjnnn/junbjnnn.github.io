package fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.dao.LoaiHopDongDAO;
import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.entity.LoaiHopDong;

@SuppressWarnings("deprecation")
@Repository
public class LoaiHopDongDAOImpl implements LoaiHopDongDAO {
	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<LoaiHopDong> listLoaiHopDong() {
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery("from LoaiHopDong");
		List<LoaiHopDong> LoaiHopDongList = query.list();

		return LoaiHopDongList;
	}
}
