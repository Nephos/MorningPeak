# coding: utf-8
u1 = Admin.create(email: "admin@wir.com", password: 'wir2015')
u2 = User.create(email: "admin@jerevedunemaison.com", password: 'jrdm2015')
u3 = User.create(email: "admin@rasecampagneimmo.com", password: 'rci2015')

c2=u2.client
c3=u3.client

co1=Contact.create(name: "Eric Chatry", client: c2)
co2=Contact.create(name: "M. Sometime", client: c3)
co3=Contact.create(name: "Mme. Chose", client: c3)

c2.update(name: "JRDM", contact: co1)

c3.update(name: "RaseCampagneImmo")

b1=Bill.create(title: "Pack complet 1 ans", amount: 5000, due_date: Date.today-15, client: c3, emission_date: Date.today-31, paid: true)
b2=Bill.create(title: "Achat nom de domaine", amount: 50, due_date: Date.today-15, client: c3, emission_date: Date.today-31, paid: false)
b3=Bill.create(title: "Mise à jour serveur", amount: 200, due_date: Date.today+31, client: c3, emission_date: Date.today)
b4=Bill.create(title: "Intervention serveur", amount: 200, due_date: Date.today+14, client: c3, emission_date: Date.today)
b5=Bill.create(title: "Intervention serveur", amount: 200, due_date: Date.today-1, client: c3, emission_date: Date.today-14, paid: true)
b6=Bill.create(title: "Intervention serveur", amount: 200, due_date: Date.today-1, client: c3, emission_date: Date.today-14)
b7=Bill.create(title: "Mise en place d'API", amount: 2000, due_date: Date.today+31, client: c3, emission_date: Date.today)

t1=Ticket.create(title: "Pas possible d'éditer la page d'acceuil", creator: u3)
t2=Ticket.create(title: "Vous avez supprimé une page. Elle a été remise en place gratuitement.", creator: u1, ticket: t1)
t3=Ticket.create(title: "Erreur API: 505.", description: "Impossible de se co à l'api, erreur 505.", creator: u2)
t3=Ticket.create(title: "Erreur API: 505", description: "Vérifiez les mots de passe (renvoyé par mail).", creator: u1, ticket: t3)
