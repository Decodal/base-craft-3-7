<?php

$vendorDir = dirname(__DIR__);
$rootDir = dirname(dirname(__DIR__));

return array (
  'craftcms/redactor' => 
  array (
    'class' => 'craft\\redactor\\Plugin',
    'basePath' => $vendorDir . '/craftcms/redactor/src',
    'handle' => 'redactor',
    'aliases' => 
    array (
      '@craft/redactor' => $vendorDir . '/craftcms/redactor/src',
    ),
    'name' => 'Redactor',
    'version' => '2.10.10',
    'description' => 'Edit rich text content in Craft CMS using Redactor by Imperavi.',
    'developer' => 'Pixel & Tonic',
    'developerUrl' => 'https://pixelandtonic.com/',
    'developerEmail' => 'support@craftcms.com',
    'documentationUrl' => 'https://github.com/craftcms/redactor/blob/v2/README.md',
  ),
  'verbb/field-manager' => 
  array (
    'class' => 'verbb\\fieldmanager\\FieldManager',
    'basePath' => $vendorDir . '/verbb/field-manager/src',
    'handle' => 'field-manager',
    'aliases' => 
    array (
      '@verbb/fieldmanager' => $vendorDir . '/verbb/field-manager/src',
    ),
    'name' => 'Field Manager',
    'version' => '2.2.5',
    'description' => 'Manage your fields and field groups with ease with simple field or group cloning and quicker overall management.',
    'developer' => 'Verbb',
    'developerUrl' => 'https://verbb.io',
    'developerEmail' => 'support@verbb.io',
    'documentationUrl' => 'https://github.com/verbb/field-manager',
    'changelogUrl' => 'https://raw.githubusercontent.com/verbb/field-manager/craft-3/CHANGELOG.md',
  ),
  'nystudio107/craft-cookies' => 
  array (
    'class' => 'nystudio107\\cookies\\Cookies',
    'basePath' => $vendorDir . '/nystudio107/craft-cookies/src',
    'handle' => 'cookies',
    'aliases' => 
    array (
      '@nystudio107/cookies' => $vendorDir . '/nystudio107/craft-cookies/src',
    ),
    'name' => 'Cookies',
    'version' => '1.1.15',
    'description' => 'A simple plugin for setting and getting cookies from within Craft CMS templates.',
    'developer' => 'nystudio107',
    'developerUrl' => 'https://nystudio107.com/',
    'documentationUrl' => 'https://nystudio107.com/plugins/cookies/documentation',
    'changelogUrl' => 'https://raw.githubusercontent.com/nystudio107/craft-cookies/v1/CHANGELOG.md',
  ),
  'verbb/kint' => 
  array (
    'class' => 'verbb\\kint\\Kint',
    'basePath' => $vendorDir . '/verbb/kint/src',
    'handle' => 'kint',
    'aliases' => 
    array (
      '@verbb/kint' => $vendorDir . '/verbb/kint/src',
    ),
    'name' => 'Kint',
    'version' => '2.0.0',
    'description' => 'Adds Kint, an in-app PHP debugger for use in Twig and PHP.',
    'developer' => 'Verbb',
    'developerUrl' => 'https://verbb.io',
    'developerEmail' => 'support@verbb.io',
    'documentationUrl' => 'https://github.com/verbb/kint',
    'changelogUrl' => 'https://raw.githubusercontent.com/verbb/kint/craft-3/CHANGELOG.md',
  ),
);
