
import 'creaters/align_creater.dart';
import 'creaters/attr/alignment_geometry_creater.dart';
import 'creaters/attr/box_constraints_creater.dart';
import 'creaters/attr/box_decoration_creater.dart';
import 'creaters/attr/decoration_asset_image_creater.dart';
import 'creaters/attr/text_editing_controller_creater.dart';
import 'creaters/attr/text_span_creater.dart';
import 'creaters/card_creater.dart';
import 'creaters/clip_creater.dart';
import 'creaters/column_creater.dart';
import 'creaters/container_creater.dart';
import 'creaters/counter_creater.dart';
import 'creaters/expanded_creater.dart';
import 'creaters/flat_button_creater.dart';
import 'creaters/image_creater.dart';
import 'creaters/ink_well_creater.dart';
import 'creaters/padding_creater.dart';
import 'creaters/positioned_creater.dart';
import 'creaters/rich_text_creater.dart';
import 'creaters/row_creater.dart';
import 'creaters/attr/share_border_creater.dart';
import 'creaters/sized_box_creater.dart';
import 'creaters/stack_creater.dart';
import 'creaters/tab_layout_creater.dart';
import 'creaters/text_creater.dart';
import 'creaters/attr/text_style_creater.dart';
import 'creaters/textfield_creater.dart';
import 'lux_creater.dart';

var lux_creaters = <LuxCreater>[
  // widget
  CardCreater(),
  ColumnCreater(),
  ContainerCreater(),
  CounterCreater(),
  FlatButtonCreater(),
  InkWellCreater(),
  PositionedCreater(),
  RichTextCreater(),
  RowCreater(),
  StackCreater(),
  TextCreater(),
  TextFieldCreater(),
  TabGroupCreater(),
  TabLayoutCreater(),
  AlignCreater(),
  ExpandedCreater(),
  FlexibleCreater(),
  ClipOvalCreater(),
  ClipRectCreater(),
  ClipRRectCreater(),
  SizedBoxCreater(),
  ImageNetCreater(),
  PaddingCreater(),

  // 以下是属性类
  BoxDecorationCreater(),
  DecorationAssetImageCreater(),
  BoxConstraintsCreater(),
  ColumnCreater(),
  TextStyleCreater(),
  TextSpanCreater(),
  RoundedRectangleBorderCreater(),
  TextEditingControllerCreater(),
  AlignmentCreater(),
  FractionalOffsetCreater(),
];
