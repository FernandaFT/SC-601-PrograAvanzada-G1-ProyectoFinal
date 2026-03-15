using System.Web.Mvc;

namespace ProyectoFinalG1.Filters
{
    public class SesionActivaAttribute : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            var session = filterContext.HttpContext.Session;

            if (session["Nombre"] == null)
            {
                filterContext.Result = new RedirectToRouteResult(
                    new System.Web.Routing.RouteValueDictionary(new
                    {
                        controller = "Home",
                        action = "InicioSesion"
                    })
                );
            }

            base.OnActionExecuting(filterContext);
        }
    }
}
