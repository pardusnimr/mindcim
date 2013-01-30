import web
import model
from web.template import render

urls = (
'/', 'index'
)

### Templates
t_globals = {
    'datestr': web.datestr
}
render = web.template.render('templates', base='base', globals=t_globals)

class index:
    def GET(self):
        """ Show devices """
        devices = model.get_devices()
        return render.index(devices)
             
app = web.application(urls, globals())

if __name__ == "__main__":
    app.run()
