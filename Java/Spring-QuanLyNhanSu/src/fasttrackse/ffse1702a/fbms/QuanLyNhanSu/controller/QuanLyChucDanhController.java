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

import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.entity.ChucDanh;
import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.service.QuanLyChucDanhService;

@Controller
public class QuanLyChucDanhController {

	@Autowired(required = true)
	private QuanLyChucDanhService quanlychucdanhService;

	@RequestMapping(value = "/qlns/chuc_danh", method = RequestMethod.GET)
	public String listChucDanh(Model model) {
		List<ChucDanh> list = quanlychucdanhService.listChucDanh();
		model.addAttribute("chucdanh", new ChucDanh());
		model.addAttribute("listChucDanh", list);
		return "QuanLyNhanSu/QuanLyChucDanh/ChucDanh";
	}

	@RequestMapping(value = "/qlns/chuc_danh/add", method = RequestMethod.GET)
	public String addChucDanh(Model model) {

		model.addAttribute("add", "TRUE");
		model.addAttribute("chucdanh", new ChucDanh());
		return "QuanLyNhanSu/QuanLyChucDanh/FormChucDanh";
	}

	// For add and update person both
	@RequestMapping(value = "/qlns/chuc_danh/save", method = RequestMethod.POST)
	public String addPerson(@ModelAttribute("chucdanh") @Valid ChucDanh p, BindingResult bindingResult, Model model,
			HttpServletRequest request) {
		ChucDanh cd = this.quanlychucdanhService.getChucDanhByMa(p.getMaChucDanh());
		boolean addAction = request.getParameter("add") != null;
		boolean checkMaChucDanh = this.quanlychucdanhService.checkChucDanh(p.getMaChucDanh());
		if (addAction) {
			model.addAttribute("add", "TRUE");
			model.addAttribute("checkMaChucDanh", checkMaChucDanh);
		}
		if (bindingResult.hasErrors() || (addAction && !checkMaChucDanh)) {
			return "QuanLyNhanSu/QuanLyChucDanh/FormChucDanh";
		}

		if (cd == null) {
			// new person, add it
			this.quanlychucdanhService.addChucDanh(p);
		} else {
			// existing person, call update
			this.quanlychucdanhService.updateChucDanh(p);
		}

		return "redirect:/qlns/chuc_danh";

	}

	@RequestMapping("/qlns/chuc_danh/edit/{maChucDanh}")
	public String editChucDanh(@PathVariable("maChucDanh") String maChucDanh, Model model) {
		model.addAttribute("chucdanh", this.quanlychucdanhService.getChucDanhByMa(maChucDanh));
		return "QuanLyNhanSu/QuanLyChucDanh/FormChucDanh";
	}

	@RequestMapping("/qlns/chuc_danh/remove/{maChucDanh}")
	public String removeChucDanh(@PathVariable("maChucDanh") String maChucDanh) {

		this.quanlychucdanhService.removeChucDanh(maChucDanh);
		return "redirect:/qlns/chuc_danh";
	}
}
