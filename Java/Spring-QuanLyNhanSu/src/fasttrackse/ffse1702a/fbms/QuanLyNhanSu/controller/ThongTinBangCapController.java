package fasttrackse.ffse1702a.fbms.QuanLyNhanSu.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.entity.HoSoNhanVien;
import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.entity.ThongTinBangCap;
import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.entity.ThongTinBangCapForm;
import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.service.QuanLyHoSoService;
import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.service.ThongTinBangCapService;
import fasttrackse.ffse1702a.fbms.Security.model.entity.UserAccount;
import fasttrackse.ffse1702a.fbms.Security.service.UserAccountService;

@Controller
public class ThongTinBangCapController {
	@Autowired
	private QuanLyHoSoService quanLyHoSoService;
	@Autowired
	private ThongTinBangCapService thongTinBangCapService;
	@Autowired
	private UserAccountService userAccountService;

	@RequestMapping(value = "/qlns/bang_cap/edit/{maNhanVien}", method = RequestMethod.GET)
	public String editThongTinBangCap(@PathVariable("maNhanVien") int maNhanVien, Model model) {
		HoSoNhanVien hsnv = this.quanLyHoSoService.getHoSoNhanVienById(maNhanVien);
		ThongTinBangCapForm thongTinBangCapForm = new ThongTinBangCapForm(hsnv.getThongTinBangCaps());
		List<ThongTinBangCap> listThongTinBangCap = thongTinBangCapForm.getListThongTinBangCap();
		if (listThongTinBangCap.size() == 0) {
			ThongTinBangCap ttbc = new ThongTinBangCap();
			ttbc.setHoSoNhanVien(hsnv);
			listThongTinBangCap.add(ttbc);
			thongTinBangCapForm.setListThongTinBangCap(listThongTinBangCap);
		}
		model.addAttribute("hoSoNhanVien", hsnv);
		model.addAttribute("thongTinBangCapForm", thongTinBangCapForm);
		return "QuanLyNhanSu/QuanLyHoSo/ThongTinBangCapForm";
	}

	@RequestMapping(value = "qlns/nv/bang_cap", method = RequestMethod.GET)
	public String viewOneBangCap(HttpServletRequest request, Model model) {

		UserAccount userAccount = this.userAccountService.loadUserByUsername(request.getUserPrincipal().getName());
		int maNhanVien = userAccount.getNhanVien().getMaNhanVien();
		model.addAttribute("role_nv", "true");
		HoSoNhanVien hsnv = this.quanLyHoSoService.getHoSoNhanVienById(maNhanVien);
		ThongTinBangCapForm thongTinBangCapForm = new ThongTinBangCapForm(hsnv.getThongTinBangCaps());
		List<ThongTinBangCap> listThongTinBangCap = thongTinBangCapForm.getListThongTinBangCap();
		if (listThongTinBangCap.size() == 0) {
			ThongTinBangCap ttbc = new ThongTinBangCap();
			ttbc.setHoSoNhanVien(hsnv);
			listThongTinBangCap.add(ttbc);
			thongTinBangCapForm.setListThongTinBangCap(listThongTinBangCap);
		}
		model.addAttribute("hoSoNhanVien", hsnv);
		model.addAttribute("thongTinBangCapForm", thongTinBangCapForm);
		return "QuanLyNhanSu/QuanLyHoSo/View/ThongTinBangCapView";
	}

	@RequestMapping(value = "/qlns/*/view/bang_cap/{maNhanVien}", method = RequestMethod.GET)
	public String viewThongTinBangCap(@PathVariable("maNhanVien") int maNhanVien, Model model) {
		HoSoNhanVien hsnv = this.quanLyHoSoService.getHoSoNhanVienById(maNhanVien);
		ThongTinBangCapForm thongTinBangCapForm = new ThongTinBangCapForm(hsnv.getThongTinBangCaps());
		List<ThongTinBangCap> listThongTinBangCap = thongTinBangCapForm.getListThongTinBangCap();
		if (listThongTinBangCap.size() == 0) {
			ThongTinBangCap ttbc = new ThongTinBangCap();
			ttbc.setHoSoNhanVien(hsnv);
			listThongTinBangCap.add(ttbc);
			thongTinBangCapForm.setListThongTinBangCap(listThongTinBangCap);
		}
		model.addAttribute("hoSoNhanVien", hsnv);
		model.addAttribute("thongTinBangCapForm", thongTinBangCapForm);
		return "QuanLyNhanSu/QuanLyHoSo/View/ThongTinBangCapView";
	}

	@RequestMapping(value = "/qlns/bang_cap/save", method = RequestMethod.POST)
	public String saveHoSoNhanVien(
			@ModelAttribute("thongTinBangCapForm") @Valid ThongTinBangCapForm thongTinBangCapForm,
			BindingResult bindingResult, Model model, RedirectAttributes redirectAttributes) {

		List<ThongTinBangCap> listThongTinBangCap = thongTinBangCapForm.getListThongTinBangCap();

		List<String> errorList = thongTinBangCapService.getErrorList(bindingResult);
		List<String> deleteList = thongTinBangCapService.getDeleteList(listThongTinBangCap);

		int maNhanVien = thongTinBangCapForm.getListThongTinBangCap().get(0).getHoSoNhanVien().getMaNhanVien();
		if (bindingResult.hasErrors() && !errorList.equals(deleteList)) {
			HoSoNhanVien hsnv = this.quanLyHoSoService.getHoSoNhanVienById(maNhanVien);
			model.addAttribute("hoSoNhanVien", hsnv);
			return "QuanLyNhanSu/QuanLyHoSo/ThongTinBangCapForm";
		}

		for (ThongTinBangCap ttbc : listThongTinBangCap) {
			int id = ttbc.getId();
			if (id == 0) {
				this.thongTinBangCapService.addThongTinBangCap(ttbc);
			} else if (id < 0) {
				this.thongTinBangCapService.deleteThongTinBangCap(Math.abs(id));
			} else {
				this.thongTinBangCapService.updateThongTinBangCap(ttbc);
			}
		}

		redirectAttributes.addFlashAttribute("SUCCESS", "TRUE");
		return "redirect:/qlns/bang_cap/edit/" + maNhanVien;
	}
}
