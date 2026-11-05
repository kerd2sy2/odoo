{
    'name': 'Custom Debranding & Full Admin Control',
    'version': '20.0.1.0.0',
    'category': 'Technical',
    'summary': 'Removes Powered by Odoo branding from login and portal pages',
    'depends': ['base', 'web'],
    'data': [
        'views/login_templates.xml',
    ],
    'installable': True,
    'auto_install': True,
    'license': 'LGPL-3',
}
