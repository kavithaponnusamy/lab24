package co.grandcircus.lab24;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sun.el.stream.Optional;



@Controller
public class PizzaController {
	
	
	@Autowired
	private PartyRepo dao;
	
	@Autowired
	private PartyOptionRepo dao2;
	

	@Autowired
	private RsvpRepo dao3;
	
	@RequestMapping("/")
	public String index() {
		return "redirect:/party";
	}
	@RequestMapping("/party")
	public String home(Model model, String name) {
		List<Party> parties = dao.findAll();
		List<Rsvp> rsvps = dao3.findAll();
		model.addAttribute("parties",parties);
		model.addAttribute("rsvps",rsvps);
		return "homepage";
	}
	@PostMapping("/party")
	public String listByName(Model model, String name) {
		
		List<Party> party=dao.findByNameContainsIgnoreCase(name);
		model.addAttribute("parties", party);
		return "homepage";
	}	
	@RequestMapping("/vote-page")
	public String listPizzaOptions(Model model) {
		List<PartyOption> partyOptions = dao2.findAll();
		model.addAttribute("partyOptions", partyOptions);
		return "vote-page";
	}
	@RequestMapping("/vote-update")
	public String listPizzaOptions1(Model model, @RequestParam("id") Long id){
		PartyOption resultPartyOption = dao2.findById(id).get();
		resultPartyOption.setVotes(resultPartyOption.getVotes()+1);
		dao2.save(resultPartyOption);
		model.addAttribute("partyOptions",resultPartyOption);		
		return "redirect:/vote-page";		
	}
	@RequestMapping("/partyOption/{id}")
	public String listPizzaOptions(Model model, @PathVariable("id") Long id){
		List <PartyOption> resultPartyOption = dao2.findByPartyId(id);
		model.addAttribute("partyOptions",resultPartyOption);		
		return "vote-page";		
	}
	@RequestMapping("/add-page")
	public String submitAdd(Model model, PartyOption pOption) {
		pOption.setVotes(0);
		dao2.save(pOption);
		model.addAttribute("partyOptions",pOption);
		return "redirect:/vote-page";		
	}
	@RequestMapping("/review-page")
	public String reviewPage(Model model, PartyOption pOption) {
		List<PartyOption> partyOptions3 = dao2.findByVotesGreaterThanOrderByVotesDesc(0);
		model.addAttribute("partyOptions", partyOptions3);
		return "review-page";
	}
	@RequestMapping("/admin-page")
	public String creatAdminPage(Model model) {
		List<Party> parties=dao.findAllOrderByDateDesc();
		model.addAttribute("parties",parties);
		return "admin-page";
	}
	@RequestMapping("/admin-add-form")
	public String addAParty() {
		return "admin-add-form";
	}
	@PostMapping("/admin-page")
	public String updateAdminPage(Model model, Party party) {
		dao.save(party);
		model.addAttribute("parties",party);
		return "redirect:/admin-page";
	}
	@RequestMapping("/party-update")
	public String editAParty(Model model, @RequestParam("id") Long id) {
		Party party=dao.findById(id).get();
		model.addAttribute("party",party);
		return "admin-edit-form";
	}
	@PostMapping("/party-update")
	public String submitEditAdminPage(Model model, Party party) {
		dao.save(party);
		return "redirect:/admin-page"; 
	}
	@RequestMapping("/delete-party")
	public String deleteAParty(Model model, @RequestParam("id") Long id) {
		dao.deleteById(id);		
		return "redirect:/admin-page";
	}
	@RequestMapping("/rsvp-submit")
	public String rsvpSubmit(Model model,Rsvp rsvp) {
		dao3.save(rsvp);		
		return "redirect:/party";
	}
	@RequestMapping("/rsvp/{id}")
	public String listPartyDetails(Model model, @PathVariable("id") Long id){
		Party party=dao.findById(id).get();
		model.addAttribute("party",party);
		List <Rsvp> rsvps = dao3.findByPartyId(id);
		model.addAttribute("rsvps",rsvps);		
		return "party-details";
		}
		
}
