package itu.examen.projetnaina.controller;

import itu.examen.projetnaina.model.User;
import itu.examen.projetnaina.model.Livre;
import itu.examen.projetnaina.repository.LivreRepository;
import itu.examen.projetnaina.repository.UserRepository;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.validation.Valid;

import java.util.List;
import java.util.Optional;


@Controller
public class HomeController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private LivreRepository livreRepository;

    @GetMapping("/")
    public String home(Model model) {
        List<Livre> listeLivre = livreRepository.findAll();
        model.addAttribute("listeLivre", listeLivre);
        return "home";
    }

    @GetMapping("/detail/{id}")
    public String viewDetail(@PathVariable("id") Long id, Model model) {
        Optional<Livre> livre = livreRepository.findById(id);
        if (livre.isPresent()) {
            model.addAttribute("livre", livre.get());
            return "detail";
        } else {
            // Handle the case where the livre is not found, maybe redirect to an error page
            return "redirect:/home";
        }
    }

    @GetMapping("/search")
    public String searchLivre(@RequestParam(value = "search", required = false) String search, Model model) {

        List<Livre> listeLivre;

        if (search != null && !search.isEmpty()) {
            listeLivre = livreRepository.searchLivres(search);
        } else {
            listeLivre = livreRepository.findAll();
        }

        model.addAttribute("listeLivre", listeLivre);
        return "home";
    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/gretting")
    public String greeting(@RequestParam(name="name", required=false, defaultValue="World") String name, Model model) {
        model.addAttribute("name", name);
        return "gretting";
    }

    @GetMapping("/person")
    public String showForm(User person) {
        return "person";
    }

    @PostMapping("/person")
    public String checkPersonInfo(@RequestParam("email") String email,
                                  @RequestParam("mdp") String mdp, Model model) {

        User existingUser = userRepository.findByEmail(email);

        if (existingUser != null && existingUser.getEmail().equals(email)) {
            model.addAttribute("error", "Email already exists");

            return "person";
        } else {

            User personInsert = new User();
            personInsert.setEmail(email);
            personInsert.setMdp(mdp);

            userRepository.save(personInsert);   // Save the user to the database
            model.addAttribute("person", personInsert);
        }

        return "result";
    }
}
