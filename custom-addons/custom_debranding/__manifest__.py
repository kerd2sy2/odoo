{
    'name': 'Custom Debranding & Full Admin Control',
    'version': '20.0.1.1.0',
    'category': 'Technical',
    'summary': 'Removes Powered by Odoo branding and hides fake Enterprise Upgrade cards in Apps',
    'depends': ['base', 'web'],
    'data': [
        'views/login_templates.xml',
        'views/ir_module_views.xml',
    ],
    'installable': True,
    'auto_install': True,
    'license': 'LGPL-3',
}
