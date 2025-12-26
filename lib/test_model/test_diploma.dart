import '../models/diplomas_model.dart';
import '../utils/app_images.dart';

final List<Diploma> allDiplomas = const [
  Diploma(
    code: 'DIP001',
    createdBy: '',
    id: '',
    instituteId: '',
    titleAr: 'دبلوم الرخصة الدولية',
    descriptionAr:
        'تؤهل لامتلاك المهارات الأساسية في استخدام الحاسوب وتطبيقاته. تتضمن الدورة...',
    photoPath: AppImages.assetsImagesLogoForeground,
    category: 'دبلومات',
  ),
  Diploma(
    code: 'DIP001',
    createdBy: '',
    id: '',
    instituteId: '',
    createdAt: '',

    titleAr: 'دبلوم تصميم الجرافيك',
    descriptionAr:
        'تغطي هذه الدورة أساسيات تصميم الجرافيك باستخدام برامج مثل الفوتوشوب والإليستريتور...',
    photoPath: AppImages.assetsImagesLogoForeground,
    category: 'جرافكس',
  ),

  Diploma(
    code: 'DIP001',
    createdBy: '',
    id: '',
    instituteId: '',
    createdAt: '',

    titleAr: 'دبلوم تطوير الويب',
    descriptionAr:
        'تتعلم في هذه الدورة كيفية بناء مواقع وتطبيقات ويب باستخدام HTML، CSS، وجافا سكريبت...',
    photoPath: AppImages.assetsImagesLogoForeground,
    category: 'حاسوب',
  ),

  Diploma(
    code: 'DIP001',
    createdBy: '',
    id: '',
    instituteId: '',
    createdAt: '',

    titleAr: 'دبلوم إدارة الأعمال',
    descriptionAr:
        'تغطي هذه الدورة المبادئ الأساسية لإدارة الأعمال، بما في ذلك التخطيط والتنظيم والقيادة...',
    photoPath: AppImages.assetsImagesLogoForeground,
    category: 'إدارة',
  ),

  Diploma(
    code: 'DIP001',
    createdBy: '',
    id: '',
    instituteId: '',
    createdAt: '',

    titleAr: 'دبلوم المحاسبة المالية',
    descriptionAr:
        'تتعلم في هذه الدورة أساسيات المحاسبة المالية، بما في ذلك إعداد القوائم المالية وتحليلها...',
    photoPath: AppImages.assetsImagesLogoForeground,
    category: 'محاسبة',
  ),

  Diploma(
    code: 'DIP001',
    createdBy: '',
    id: '',
    instituteId: '',
    createdAt: '',

    titleAr: 'دبلوم اللغة الإنجليزية للأعمال',
    descriptionAr:
        'تركز هذه الدورة على تطوير مهارات اللغة الإنجليزية في سياق الأعمال والتواصل المهني...',
    photoPath: AppImages.assetsImagesLogoForeground,
    category: 'انجليزي',
  ),

  Diploma(
    code: 'DIP001',
    createdBy: '',
    id: '',
    instituteId: '',
    createdAt: '',

    titleAr: 'دبلوم التسويق الرقمي',
    descriptionAr:
        'تغطي هذه الدورة استراتيجيات التسويق عبر الإنترنت، بما في ذلك وسائل التواصل الاجتماعي وتحسين محركات البحث...',
    photoPath: AppImages.assetsImagesLogoForeground,
    category: 'إدارة',
  ),
];

final List<String> categories = const [
  'دبلومات',
  'حاسوب',
  'جرافكس',
  'انجليزي',
  'إدارة',
  'محاسبة',
];
