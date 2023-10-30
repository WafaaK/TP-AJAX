/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ma.school.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ma.school.beans.Etudiant;
import ma.school.service.EtudiantService;

/**
 *
 * @author leblond
 */
@WebServlet(name = "EtudiantController", urlPatterns = {"/EtudiantController"})
public class EtudiantController extends HttpServlet {

    String op = null;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

    @Override
    public void init()
            throws ServletException {
        super.init(); //To change body of generated methods, choose Tools | Templates.
        op = null;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        op = request.getParameter("op");
        EtudiantService es = new EtudiantService();

        if (op.equals("Envoyer")) {
            String nom = request.getParameter("nom");
            String prenom = request.getParameter("prenom");
            String ville = request.getParameter("ville");
            String date = request.getParameter("dateNaissance");
            System.out.println(date);
            Date dateNaissance = new Date(date.replace("-", "/"));
            String sexe = request.getParameter("sexe");
            es.create(new Etudiant(nom, prenom, ville, dateNaissance, sexe));
            response.sendRedirect("etudiantForm.jsp");
        } else if (op.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            es.delete(es.findById(id));
            response.sendRedirect("etudiantForm.jsp");
        } else if (op.equals("update")) {
    try {
        int id = Integer.parseInt(request.getParameter("id"));
        String newNom = request.getParameter("newNom");
        String newPrenom = request.getParameter("newPrenom");
        String newVille = request.getParameter("newVille");
        String newDate = request.getParameter("newDateNaissance");
        Date newDateNaissance = new Date(newDate.replace("-", "/"));
        String newSexe = request.getParameter("newSexe");

        Etudiant etudiantToUpdate = es.findById(id);
        if (etudiantToUpdate != null) {
            etudiantToUpdate.setNom(newNom);
            etudiantToUpdate.setPrenom(newPrenom);
            etudiantToUpdate.setVille(newVille);
            etudiantToUpdate.setDateNaissance(newDateNaissance);
            etudiantToUpdate.setSexe(newSexe);
            es.update(etudiantToUpdate); // Appel à la méthode de mise à jour

            response.sendRedirect("etudiantForm.jsp");
        } else {
            // Gérer le cas où l'étudiant n'a pas été trouvé (peut-être afficher un message d'erreur)
            response.getWriter().println("L'étudiant n'a pas été trouvé.");
        }
    } catch (Exception e) {
        // Gérer l'exception ici (par exemple, afficher un message d'erreur)
        response.getWriter().println("Une erreur s'est produite lors de la mise à jour de l'étudiant : " + e.getMessage());
    }
}

}


    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}


