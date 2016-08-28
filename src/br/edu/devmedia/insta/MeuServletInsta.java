package br.edu.devmedia.insta;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jinstagram.Instagram;
import org.jinstagram.auth.model.Token;
import org.jinstagram.auth.model.Verifier;
import org.jinstagram.auth.oauth.InstagramService;

public class MeuServletInsta extends HttpServlet {
	
	public static final String SERVICO_INSTA = "instServico";
	public static final String OBJETO_INSTA = "objServico";
	
	private static final long serialVersionUID = -5249713188129556149L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String codigo = req.getParameter("code");
		
		InstagramService servico = (InstagramService) req.getSession().getAttribute(SERVICO_INSTA);
		
		Verifier verifier = new Verifier(codigo);
		
		Token token = servico.getAccessToken(null, verifier);
		
		Instagram insta = new Instagram(token);
		req.getSession().setAttribute(OBJETO_INSTA, insta);
		
		resp.sendRedirect(req.getContextPath() + "/perfil.jsp");
	}

}
