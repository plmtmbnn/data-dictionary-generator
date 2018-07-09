package org.sia.controller;

import org.apache.poi.xwpf.usermodel.XWPFTable;
import org.apache.poi.xwpf.usermodel.XWPFTableRow;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.apache.poi.xwpf.usermodel.XWPFRun;
import java.io.FileOutputStream;
import org.apache.poi.xwpf.usermodel.XWPFDocument;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import java.net.URL;
import java.util.ResourceBundle;
import javafx.fxml.Initializable;
import javafx.fxml.FXML;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javafx.event.ActionEvent;
import javafx.scene.control.ComboBox;
import javafx.stage.FileChooser;
import javafx.stage.FileChooser.ExtensionFilter;
import org.w3c.dom.NodeList;
import javax.xml.bind.JAXBException;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;

import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.scene.control.ListView;

import javafx.scene.control.TableView;
import javafx.collections.ObservableList;
import javafx.scene.control.TableColumn;
import javafx.collections.FXCollections;
import javafx.collections.ListChangeListener;
import javafx.scene.control.TablePosition;
import javafx.scene.control.Button;
import javafx.scene.control.Alert;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.sql.Timestamp;
import java.util.ArrayList;
import org.sia.model.Attribute;
import org.sia.model.DataDictonary;

import java.util.LinkedHashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.sia.dao.AttributeDao;
import org.sia.dao.DataDictionaryDao;
import org.sia.dao.DataDictionaryAttributeDao;
import org.sia.dao.impl.AttributeDaoImplHibernate;
import org.sia.dao.impl.DataDictionaryDaoImplHibernate;
import org.sia.dao.impl.DataDictionaryAttributeDaoImplHibernate;
import org.sia.model.DataDictionaryAttribute;

public class UtamaController implements Initializable {

    @FXML
    private Button btnFile, btnTambah, btnDelete, btnReset, btnGenerate;
    @FXML
    private ComboBox cbDataType, cbDocumentType;
    @FXML
    private ListView listview;
    @FXML
    private TableView<Attribute> tableViewDD;
    @FXML
    private TextField tfLength, tfAlias, tfField, tfKode, tfNamaProses, tfAktivitas, tfDokumen, tfAktor, tfKodeDataDictionary;
    @FXML
    private TextArea taDescription, tfDeskripsi;
    @FXML
    private TableColumn<Attribute, String> field, dataType, alias, length, description;

    private Attribute data = null;

    ObservableList<Attribute> items = FXCollections.observableArrayList();
    ObservableList<String> options = FXCollections.observableArrayList();
    ObservableList<Attribute> storedItems = FXCollections.observableArrayList();
    ArrayList<String> listDataObject = new ArrayList();

    Map<String, String> mapCodeDD = new HashMap<>();
    Map<String, String> mapDataObject = new HashMap<>();
    Map<String, String> mapActivity = new HashMap<>();
    Map<String, String> mapTargetSource = new HashMap<>();
    Map<String, String> mapDataObjectActivity = new HashMap<>();
    Map<String, String> mapActor = new HashMap<>();
    Map<String, String> mapDataType = new HashMap<>();
    Map<String, String> mapDeskripsi = new HashMap<>();
    Map<String, Integer> mapStoredAttributes = new HashMap<>();
    Map<String, Integer> mapActorCoordinate = new HashMap<>();
    Map<String, Integer> mapActorCoordinateSorted = new LinkedHashMap<>();
    Map<String, Integer> mapDataObjectCoordinate = new HashMap<>();
    Map<String, DataDictonary> mapDataDictionary = new HashMap<>();

    private final AttributeDao attributeDao;
    private final DataDictionaryDao dataDictionaryDao;
    private final DataDictionaryAttributeDao dataDictonaryAttibuteDao;

    private String cellValue = "";
    private String path = "";
    private String kodeProses = "";
    private String namaProses = "";

    //construct
    public UtamaController() {
        tableViewDD = new TableView<>();
        attributeDao = new AttributeDaoImplHibernate();
        dataDictionaryDao = new DataDictionaryDaoImplHibernate();
        dataDictonaryAttibuteDao = new DataDictionaryAttributeDaoImplHibernate();
    }

    //fungsi ini untuk meload file xml yang sudah diattach
    @FXML
    private void loadFileXml(ActionEvent event) throws JAXBException {
        try {
            FileChooser fc = new FileChooser();
            fc.setInitialDirectory(new File("D:\\12S14026_POLMA\\Semester 8\\TA 2\\data dictionary"));
            fc.getExtensionFilters().addAll(new ExtensionFilter("xml file", "*.xpdl"));
            File selectedFile = fc.showOpenDialog(null);
            if (selectedFile != null) {
                clearTable();
                clearAttributeForm();
                mapTargetSource.clear();
                listview.getItems().clear();
                listDataObject.clear();
                path = selectedFile.getAbsolutePath().replace(selectedFile.getName(), "");
                String splits[] = selectedFile.getName().split(".xpdl");
                tfKode.setText(splits[0]);
                kodeProses = splits[0];
                DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
                DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
                Document doc = dBuilder.parse(selectedFile.getAbsolutePath());
                doc.getDocumentElement().normalize();
                NodeList nListActivity = doc.getElementsByTagName("Activity");
                NodeList nListAssociation = doc.getElementsByTagName("Association");
                NodeList nListDocumentation = doc.getElementsByTagName("Documentation");
                NodeList nListCoordinates = doc.getElementsByTagName("Coordinates");
                NodeList vendor = doc.getElementsByTagName("Vendor");

                String vendorString = null;
                for (int temp = 0; temp < vendor.getLength(); temp++) {
                    Node nNode = vendor.item(temp);
                    if (nNode.getNodeType() == Node.ELEMENT_NODE) {
                        Element eElement = (Element) nNode;
                        vendorString = eElement.getTextContent();
                    }
                }
                if (vendorString.equalsIgnoreCase("Bizagi Process Modeler.")) {
                    for (int temp = 0; temp < nListAssociation.getLength(); temp++) {
                        Node nNode = nListAssociation.item(temp);
                        String target, source;
                        if (nNode.getNodeType() == Node.ELEMENT_NODE) {
                            Element eElement = (Element) nNode;
                            target = eElement.getAttribute("Target");
                            source = eElement.getAttribute("Source");
                            mapTargetSource.put(source, target);
                        }
                    }
                    mapActivity.clear();
                    for (int temp = 0; temp < nListActivity.getLength(); temp++) {
                        Node nNode = nListActivity.item(temp);
                        String name, id;
                        if (nNode.getNodeType() == Node.ELEMENT_NODE) {
                            Element eElement = (Element) nNode;
                            name = eElement.getAttribute("Name");
                            id = eElement.getAttribute("Id");
                            mapActivity.put(id, name);
                        }
                    }

                    for (int temp = 0; temp < nListCoordinates.getLength(); temp++) {
                        Node nNode = nListCoordinates.item(temp);
                        String name, id;
                        if (nNode.getNodeType() == Node.ELEMENT_NODE) {
                            Element eElement = (Element) nNode;
                            name = eElement.getAttribute("Name");
                            id = eElement.getAttribute("Id");
                            mapActivity.put(id, name);
                        }
                    }

                    Map<String, String> mapSubProcessTaskCoordinate = new HashMap<>();
                    Map<String, String> mapSubProcessDataObjectCoordinate = new HashMap<>();

                    for (int temp = 0; temp < nListCoordinates.getLength(); temp++) {
                        Node nNode = nListCoordinates.item(temp);
                        if (nNode.getNodeType() == Node.ELEMENT_NODE) {
                            Element eElement = (Element) nNode;
                            Element eElementParent = (Element) eElement.getParentNode().getParentNode().getParentNode();

                            if (eElementParent.getNodeName().equals("Activity")) {
                                mapSubProcessTaskCoordinate.put(eElementParent.getAttribute("Name"), eElement.getAttribute("YCoordinate"));
                            }
                        }
                    }

                    for (int temp = 0; temp < nListCoordinates.getLength(); temp++) {
                        Node nNode = nListCoordinates.item(temp);
                        if (nNode.getNodeType() == Node.ELEMENT_NODE) {
                            Element eElement = (Element) nNode;
                            Element eElementParent = (Element) eElement.getParentNode().getParentNode().getParentNode();
                            Element eElementParent2 = (Element) eElementParent.getParentNode().getParentNode();

                            if (eElementParent2.getNodeName().equals("ActivitySet") && eElementParent.getNodeName().equalsIgnoreCase("DataObject")) {
                                mapSubProcessDataObjectCoordinate.put(eElementParent.getAttribute("Name"), mapSubProcessTaskCoordinate.get(eElementParent2.getAttribute("Name")));
                            }
                        }
                    }

                    for (Map.Entry<String, String> entry2 : mapSubProcessDataObjectCoordinate.entrySet()) {
                        System.out.println(entry2.getKey() + "|" + entry2.getValue());
                    }

                    mapDataObject.clear();
                    mapDataObjectCoordinate.clear();
                    mapActorCoordinate.clear();
                    listDataObject.clear();
                    int num = 1;
                    for (int temp = 0; temp < nListCoordinates.getLength(); temp++) {
                        Node nNode = nListCoordinates.item(temp);
                        String name, id;
                        if (nNode.getNodeType() == Node.ELEMENT_NODE) {
                            Element eElement = (Element) nNode;
                            Element eElementParent = (Element) eElement.getParentNode().getParentNode().getParentNode();

                            name = eElementParent.getAttribute("Name");
                            id = eElementParent.getAttribute("Id");
                            if (eElementParent.getNodeName().equalsIgnoreCase("lane")) {
                                mapActorCoordinate.put(eElementParent.getAttribute("Name"), Integer.parseInt(eElement.getAttribute("YCoordinate")));
                            }
                            if (eElementParent.getNodeName().equalsIgnoreCase("DataObject")) {

                                if (mapSubProcessDataObjectCoordinate.get(eElementParent.getAttribute("Name")) != null) {
                                    mapDataObjectCoordinate.put(eElementParent.getAttribute("Name"), Integer.parseInt(mapSubProcessDataObjectCoordinate.get(eElementParent.getAttribute("Name"))));
                                } else {
                                    mapDataObjectCoordinate.put(eElementParent.getAttribute("Name"), Integer.parseInt(eElement.getAttribute("YCoordinate")));
                                }
                                mapDataObject.put(id, name);
                                listDataObject.add(name);
                                String codeDD = "DD-" + splits[0] + "-" + String.format("%03d", num);
                                mapCodeDD.put(name, codeDD);
                                num++;
                            }
                        }
                    }

                    int flag = 0;
                    for (int temp = 0; temp < nListCoordinates.getLength(); temp++) {
                        Node nNode = nListCoordinates.item(temp);
                        if (nNode.getNodeType() == Node.ELEMENT_NODE) {
                            Element eElement = (Element) nNode;
                            Element eElementParent = (Element) eElement.getParentNode().getParentNode().getParentNode();
                            if (eElementParent.getNodeName().equalsIgnoreCase("Pool")) {
                                flag++;
                                if (flag == 2) {
                                    namaProses = eElementParent.getAttribute("Name");
                                }
                                if (flag > 2) {
                                    mapActorCoordinate.put(eElementParent.getAttribute("Name"), Integer.parseInt(eElement.getAttribute("YCoordinate")));
                                }
                            }

                        }
                    }

                    mapDeskripsi.clear();
                    for (int temp = 0; temp < nListDocumentation.getLength(); temp++) {
                        Node nNode = nListDocumentation.item(temp);
                        if (nNode.getNodeType() == Node.ELEMENT_NODE) {
                            Element eElement = (Element) nNode;
                            Element eElement2 = (Element) eElement.getParentNode().getParentNode();
                            if (eElement2.getAttribute("Name").equalsIgnoreCase(mapDataObject.get(eElement2.getAttribute("Id")))) {
                                String string = eElement.getTextContent();
                                String[] split = string.split("#");

                                String atributes = "";
                                for (int j = 0; j < split.length; j++) {
                                    if (j == 0 || j == 1 || j > split.length - 2) {
                                    } else {
                                        atributes = atributes + "#" + split[j];
                                    }
                                    mapDeskripsi.put(eElement2.getAttribute("Name"), atributes);
                                }
                            }
                        }
                    }
                    loadListView(listDataObject);
                }
            } else {
                System.out.println("file is not valid");
            }

        } catch (Exception e) {
            Alert test = new Alert(Alert.AlertType.WARNING);
            test.setTitle("Notification");
            test.setHeaderText("Gagal dibuka!");
            String message = "File XML tidak sesuai!";
            test.setContentText(message);
            test.showAndWait();
            System.out.println(e.toString());
        }

        int flag1 = 0;
        int flag2 = 0;
        int id = 0;

        mapActorCoordinateSorted.clear();
        mapActorCoordinate.entrySet().stream()
                .sorted(Map.Entry.<String, Integer>comparingByValue().reversed())
                .forEachOrdered(x -> mapActorCoordinateSorted.put(x.getKey(), x.getValue()));

        mapActor.clear();
        for (Map.Entry<String, Integer> entry : mapDataObjectCoordinate.entrySet()) {
            int coordinate = entry.getValue();
            for (Map.Entry<String, Integer> entry2 : mapActorCoordinateSorted.entrySet()) {
                if (id == 0) {
                    flag1 = entry2.getValue();
                    flag2 = flag1 * flag1;
                } else {
                    flag1 = entry2.getValue();
                }
                if (coordinate >= flag1 && coordinate <= flag2) {
                    mapActor.put(entry.getKey(), entry2.getKey());
                }
                id++;
                flag2 = flag1;
            }
            id = 0;
            flag1 = 0;
            flag2 = 0;
        }

        for (Map.Entry<String, String> entry : mapTargetSource.entrySet()) {
            for (Map.Entry<String, String> entry2 : mapDataObject.entrySet()) {
                if (entry2.getKey().equalsIgnoreCase(entry.getValue())) {
                    mapTargetSource.replace(entry.getKey(), entry.getValue(), entry2.getValue());
                }
            }
        }

        mapDataObjectActivity.clear();
        for (Map.Entry<String, String> entry : mapTargetSource.entrySet()) {
            for (Map.Entry<String, String> entry2 : mapActivity.entrySet()) {
                if (entry2.getKey().equalsIgnoreCase(entry.getKey())) {
                    mapDataObjectActivity.put(entry.getValue(), entry2.getValue());
                }
            }
        }
    }

    //fungsi ini untuk meload list data object yang ditemukan
    private void loadListView(ArrayList<String> datas) {
        datas.forEach((newItem) -> {
            listview.getItems().add(newItem);
        });
    }

    //fungsi ini untuk meread apakah data yang sudah pernah distore di database atau tidak
    private void read() {
        storedItems.clear();
        mapStoredAttributes.clear();

        DataDictonary availabledataDictionary = null;
        for (DataDictonary dataDictonary : dataDictionaryDao.getAllDataDictonaries()) {
            if (tfKodeDataDictionary.getText().equalsIgnoreCase(dataDictonary.getDataDictionaryCode())) {
                availabledataDictionary = dataDictonary;
            }
            mapDataDictionary.put(dataDictonary.getDataDictionaryCode(), dataDictonary);
        }

        if (availabledataDictionary == null) {
            for (Attribute attribute : attributeDao.getAllAttributes()) {
                storedItems.add(attribute);
                mapStoredAttributes.put(attribute.getAttributeName(), attribute.getId());
            }
        } else {
            for (DataDictionaryAttribute dataDictionaryAttribute : dataDictonaryAttibuteDao.getAllDataDictionaryAttributes()) {
                if (availabledataDictionary.getId() == dataDictionaryAttribute.getDataDictionaryId()) {
                    Attribute attribute = attributeDao.getAttribute(dataDictionaryAttribute.getAttributeId());
                    storedItems.add(attribute);
                    mapStoredAttributes.put(attribute.getAttributeName(), attribute.getId());
                }
            }
        }
    }

    //fungsi ini untuk menggenerate data dictionary kebentuk word
    private void msWordGenerate(int id) throws Exception {
        XWPFDocument document = new XWPFDocument();
        try (FileOutputStream out = new FileOutputStream(new File(path + tfKodeDataDictionary.getText() + ".docx"))) {
            DataDictonary dataDictionary = dataDictionaryDao.getAttribute(id);

            XWPFParagraph paragraph = document.createParagraph();
            XWPFRun run = paragraph.createRun();
            run.addBreak();
            run.setText("Kode Data Dictionary");
            run.addTab();
            run.setText(": " + dataDictionary.getDataDictionaryCode());
            run.addBreak();
            run.setText("Nama Dokumen");
            run.addTab();
            run.setText(": " + dataDictionary.getDocumentName());
            run.addBreak();
            run.setText("Bentuk Data");
            run.addTab();
            run.addTab();
            run.setText(": " + dataDictionary.getDataForm());
            run.addBreak();
            run.setText("Kode Proses");
            run.addTab();
            run.addTab();
            run.setText(": " + dataDictionary.getProcessCode());
            run.addBreak();
            run.setText("Nama Proses");
            run.addTab();
            run.addTab();
            run.setText(": " + dataDictionary.getProcessName());
            run.addBreak();
            run.setText("Aktivitas");
            run.addTab();
            run.addTab();
            run.setText(": " + dataDictionary.getActivity());
            run.addBreak();
            run.setText("Aktor");
            run.addTab();
            run.addTab();
            run.addTab();
            run.setText(": " + dataDictionary.getActor());
            run.addBreak();
            run.setText("Atribut");
            run.addTab();
            run.addTab();
            run.addTab();
            run.setText(":");

            XWPFTable table = document.createTable();

            XWPFTableRow tableRowOne = table.getRow(0);
            tableRowOne.getCell(0).setText("Nama Atribut");
            tableRowOne.addNewTableCell().setText("Alias");
            tableRowOne.addNewTableCell().setText("Data Type");
            tableRowOne.addNewTableCell().setText("Length");
            tableRowOne.addNewTableCell().setText("Description");

            dataDictonaryAttibuteDao.getAllDataDictionaryAttributes().stream().filter((allDataDictionaryAttribute)
                    -> (allDataDictionaryAttribute.getDataDictionaryId() == id)).forEachOrdered((allDataDictionaryAttribute) -> {
                XWPFTableRow tableRows = table.createRow();
                tableRows.getCell(0).setText(attributeDao.getAttribute(allDataDictionaryAttribute.getAttributeId()).getAttributeName());
                tableRows.getCell(1).setText(attributeDao.getAttribute(allDataDictionaryAttribute.getAttributeId()).getAlias());
                tableRows.getCell(2).setText(attributeDao.getAttribute(allDataDictionaryAttribute.getAttributeId()).getDataType());
                tableRows.getCell(3).setText(attributeDao.getAttribute(allDataDictionaryAttribute.getAttributeId()).getLength());
                tableRows.getCell(4).setText(attributeDao.getAttribute(allDataDictionaryAttribute.getAttributeId()).getDescription());
            });

            run.setText(table.getText());

            XWPFParagraph paragraph2 = document.createParagraph();
            XWPFRun run2 = paragraph2.createRun();

            run2.setText("Deskripsi");
            run2.addTab();
            run2.addTab();
            run2.setText(": " + dataDictionary.getDescription());
            run2.addBreak();

            document.write(out);
        }
        System.out.println("Data dictionary berhasil digenerate dalam bentuk word!");
    }

    //fungsi ini untuk meload detail atribut berdasarkan data object yang diklik pada list data object
    private void loadAttributesBaseOnDataObject(DataDictonary dataDictionary, String newValue) {
        items.clear();
        String[] split = mapDeskripsi.get(newValue).split("#");
        if (dataDictionary != null) {
            for (DataDictionaryAttribute dda : dataDictonaryAttibuteDao.getAllDataDictionaryAttributes()) {
                if (dda.getDataDictionaryId() == dataDictionary.getId()) {
                    items.add(attributeDao.getAttribute(dda.getAttributeId()));
                }
            }
        } else {
            for (int i = 0; i < split.length; i++) {
                if (i == 0) {
                } else {
                    if (mapStoredAttributes.get(split[i]) != null) {
                        System.out.println(mapStoredAttributes.get(split[i]));
                        if (split[i].equalsIgnoreCase(attributeDao.getAttribute(mapStoredAttributes.get(split[i])).getAttributeName())) {
                            items.add(attributeDao.getAttribute(mapStoredAttributes.get(split[i])));
                        }
                    } else {
                        items.add(new Attribute(
                                attributeDao.getAllAttributes().size() + 1, split[i], "", "", "", "",
                                null,
                                null));
                    }
                }
            }
        }
    }

    //fungsi ini untuk menampilkan detail item data object yang diklik dan mengisi semua kolom
    private void selectListViewItem() {
        clearTable();
        data = null;
        tableViewDD.getSelectionModel().setCellSelectionEnabled(false);
        data = null;
        reset();
        listview.getSelectionModel().selectedItemProperty()
                .addListener(new ChangeListener<String>() {
                    public void changed(
                            ObservableValue<? extends String> observable,
                            String oldValue, String newValue) {
                        tfDeskripsi.clear();
                        System.out.println(newValue);
                        if (mapDataDictionary.get(mapCodeDD.get(newValue)) != null
                                && mapCodeDD.get(newValue).equalsIgnoreCase(mapDataDictionary.get(mapCodeDD.get(newValue)).getDataDictionaryCode())) {
                            tfDokumen.setText(mapDataDictionary.get(mapCodeDD.get(newValue)).getDocumentName());
                            cbDocumentType.setValue(mapDataDictionary.get(mapCodeDD.get(newValue)).getDataForm());
                            tfAktivitas.setText(mapDataDictionary.get(mapCodeDD.get(newValue)).getActivity());
                            tfAktor.setText(mapDataDictionary.get(mapCodeDD.get(newValue)).getActor());
                            tfKodeDataDictionary.setText(mapDataDictionary.get(mapCodeDD.get(newValue)).getDataDictionaryCode());
                            tfKode.setText(mapDataDictionary.get(mapCodeDD.get(newValue)).getProcessCode());
                            tfNamaProses.setText(mapDataDictionary.get(mapCodeDD.get(newValue)).getProcessName());
                            tfDeskripsi.setText(mapDataDictionary.get(mapCodeDD.get(newValue)).getDescription());
                            if (newValue != null) {
                                loadAttributesBaseOnDataObject(mapDataDictionary.get(mapCodeDD.get(newValue)), newValue);
                            }
                        } else {
                            tfDokumen.setText(newValue);
                            tfAktivitas.setText(mapDataObjectActivity.get(newValue));
                            tfAktor.setText(mapActor.get(newValue));
                            tfKodeDataDictionary.setText(mapCodeDD.get(newValue));
                            tfKode.setText(kodeProses);
                            tfNamaProses.setText(namaProses);
                            if (newValue != null) {
                                loadAttributesBaseOnDataObject(mapDataDictionary.get(mapCodeDD.get(newValue)), newValue);
                            }
                        }
                    }
                });
        loadTable();
    }

    //fungsi ini untuk meload detail atribut yang diklik ke kolom atribut, difungsikan untuk mengadd atau mengedit atribut.
    private void selectTableViewItem() {
        tableViewDD.getSelectionModel().setCellSelectionEnabled(true);
        ObservableList selectedCells = tableViewDD.getSelectionModel().getSelectedCells();
        selectedCells.addListener(new ListChangeListener() {
            @Override
            public void onChanged(ListChangeListener.Change c) {
                TablePosition tablePosition = (TablePosition) selectedCells.get(0);
                Object val = tablePosition.getTableColumn().getCellData(tablePosition.getRow());
                cellValue = (String) val;
                System.out.println(cellValue);
                if (cellValue != null) {
                    for (Attribute item : items) {
                        if (cellValue.equalsIgnoreCase(item.getAttributeName())) {
                            tfField.setText(item.getAttributeName());
                            tfAlias.setText(item.getAlias());
                            cbDataType.setValue(item.getDataType());
                            tfLength.setText(item.getLength());
                            taDescription.setText(item.getDescription());
                            data = new Attribute(item.getId(), item.getAttributeName(), item.getDataType(), item.getLength(),
                                    item.getDescription(), item.getAlias(),
                                    item.getCreatedAt(),
                                    item.getUpdatedAt());
                        }
                    }
                }
            }
        });
    }

    //fungsi ini untuk add atau update atribut
    @FXML
    private void addUpdateAtrributes(ActionEvent event) {
        ArrayList<String> errors = new ArrayList<>();
        if (tfField.getText().isEmpty()) {
            errors.add("Field tidak boleh kosong!");
        }
        if (cbDataType.getSelectionModel().isEmpty()) {
            errors.add("Tipe data harus dipilih!");
        } else {
            if (tfLength.getText().isEmpty()) {
                errors.add("Length tidak boleh kosong");
            } else {
                if (!tfLength.getText().matches("\\d*")) {
                    errors.add("Inputan length harus integer!");
                } else {
                    if (Integer.parseInt(tfLength.getText()) > Integer.parseInt(mapDataType.get(cbDataType.getValue().toString()))) {
                        errors.add("Length tipe data " + cbDataType.getValue().toString() + " tidak boleh lebih dari " + mapDataType.get(cbDataType.getValue().toString()) + "!");
                    }
                }
            }
        }

        if (errors.size() > 0) {
            Alert test = new Alert(Alert.AlertType.WARNING);
            test.setTitle("Peringatan");
            test.setHeaderText("Atribut gagal ditambahkan!");
            String message = "";
            for (String error : errors) {
                message = message + "\n" + error;
            }
            test.setContentText(message);
            test.showAndWait();
        } else {
            if (taDescription.getText().equalsIgnoreCase("")) {
                taDescription.setText("-");
            }
            if (tfAlias.getText().equalsIgnoreCase("")) {
                tfAlias.setText("-");
            }
            if (data != null) {
                int id = 0;
                for (Attribute item : items) {
                    if (item.getAttributeName().equalsIgnoreCase(cellValue)) {
                        try {
                            items.get(id).setAttributeName(tfField.getText());
                            items.get(id).setDataType(cbDataType.getValue().toString());
                            items.get(id).setDescription(taDescription.getText());
                            items.get(id).setLength(tfLength.getText());
                            items.get(id).setAlias(tfAlias.getText());
                            tfField.clear();
                            tfAlias.clear();
                            tfLength.clear();
                            taDescription.clear();
                        } catch (Exception e) {
                        }
                    }
                    id++;
                }
            } else {
                items.add(new Attribute(
                        items.size() + 1,
                        tfField.getText(),
                        cbDataType.getValue().toString(),
                        tfLength.getText(),
                        taDescription.getText(),
                        tfAlias.getText(),
                        null,
                        null));

                tfField.clear();
                tfAlias.clear();
                tfLength.clear();
                taDescription.clear();
            }
            data = null;
            loadTable();
        }
    }

    //fungsi ini untuk meload daftar value tipe data yang digunakan
    private void loadDataType() {
        mapDataType.put("Boolean", "1");
        mapDataType.put("String", "4294967295");
        mapDataType.put("Integer", "11");
        mapDataType.put("Double", "18");
        mapDataType.put("Date", "10");
        mapDataType.put("Currency", "15");

        for (Map.Entry<String, String> entry2 : mapDataType.entrySet()) {
            options.add(entry2.getKey());
        }
        options.forEach((option) -> {
            cbDataType.getItems().add(option);
        });
    }

    //fungsi ini untuk store data dictionary dan atributnya ke database
    private void write() throws Exception {
//====================================DATA DICTIONARY======================================================        
        DataDictonary dataDict = new DataDictonary();
        DataDictonary newDataDictonary = new DataDictonary(0, tfKodeDataDictionary.getText(), tfDokumen.getText(), cbDocumentType.getValue().toString(),
                tfKode.getText(), tfNamaProses.getText(), tfAktivitas.getText(),
                tfAktor.getText(), tfDeskripsi.getText(),
                null,
                null);
        int flagDD = 0;
        if (dataDictionaryDao.getAllDataDictonaries().isEmpty()) {
            newDataDictonary.setCreatedAt(new Timestamp(System.currentTimeMillis()));
            dataDict = dataDictionaryDao.saveDataDictonary(newDataDictonary);
        } else {
            for (DataDictonary dataDictonary : dataDictionaryDao.getAllDataDictonaries()) {
                if (dataDictonary.getDataDictionaryCode().equals(tfKodeDataDictionary.getText())) {
                    flagDD++;
                    ArrayList<Integer> checkUpdated = new ArrayList();

                    if (!dataDictonary.getActivity().equals(newDataDictonary.getActivity())) {
                        checkUpdated.add(1);
                    }
                    if (!dataDictonary.getActor().equals(newDataDictonary.getActor())) {
                        checkUpdated.add(1);
                    }
                    if (!dataDictonary.getDescription().equals(newDataDictonary.getDescription())) {
                        checkUpdated.add(1);
                    }
                    if (!dataDictonary.getDocumentName().equals(newDataDictonary.getDocumentName())) {
                        checkUpdated.add(1);
                    }
                    if (!dataDictonary.getDataForm().equals(newDataDictonary.getDataForm())) {
                        checkUpdated.add(1);
                    }
                    if (!dataDictonary.getProcessCode().equals(newDataDictonary.getProcessCode())) {
                        checkUpdated.add(1);
                    }
                    if (!dataDictonary.getProcessName().equals(newDataDictonary.getProcessName())) {
                        checkUpdated.add(1);
                    }
                    if (checkUpdated.isEmpty()) {
                    } else {
                        newDataDictonary.setCreatedAt(dataDictonary.getCreatedAt());
                        newDataDictonary.setUpdatedAt(new Timestamp(System.currentTimeMillis()));
                        dataDict = dataDictionaryDao.updateDataDictonary(newDataDictonary);
                        break;
                    }
                }
            }
            if (flagDD == 0) {
                newDataDictonary.setCreatedAt(new Timestamp(System.currentTimeMillis()));
                dataDict = dataDictionaryDao.saveDataDictonary(newDataDictonary);
            }
        }

//===========================================ATTRIBUTE======================================================        
        ArrayList<Attribute> attributes = (ArrayList<Attribute>) attributeDao.getAllAttributes();

        ArrayList<Attribute> listIdAttributes = new ArrayList();

        for (DataDictionaryAttribute dda : dataDictonaryAttibuteDao.getAllDataDictionaryAttributes()) {
            if (dda.getDataDictionaryId() == dataDict.getId()) {
                listIdAttributes.add(attributeDao.getAttribute(dda.getAttributeId()));
            }
        }
        if (listIdAttributes.isEmpty()) {
            items.forEach((item) -> {
                int flag = 0;
                for (Attribute attribute : attributes) {
                    if (attribute.getAttributeName().equalsIgnoreCase(item.getAttributeName())) {
                        ArrayList<Integer> checkUpdated = new ArrayList();
                        if (!item.getAlias().equals(attribute.getAlias())) {
                            checkUpdated.add(1);
                        }
                        if (!item.getDataType().equals(attribute.getDataType())) {
                            checkUpdated.add(1);
                        }
                        if (!item.getDescription().equals(attribute.getDescription())) {
                            checkUpdated.add(1);
                        }
                        if (!item.getAttributeName().equals(attribute.getAttributeName())) {
                            checkUpdated.add(1);
                        }
                        if (!item.getLength().equals(attribute.getLength())) {
                            checkUpdated.add(1);
                        }

                        if (checkUpdated.isEmpty()) {
                        } else {
                            item.setCreatedAt(attribute.getCreatedAt());
                            item.setUpdatedAt(new Timestamp(System.currentTimeMillis()));
                            attributeDao.updateAttribute(item);
                        }
                    } else {
                        flag++;
                    }
                }
                if (flag == attributes.size()) {
                    item.setId(0);
                    item.setCreatedAt(new Timestamp(System.currentTimeMillis()));
                    attributeDao.saveAttribute(item);
                }
                flag = 0;
            });
        } else {
            items.forEach((item) -> {
                item.setCreatedAt(item.getCreatedAt());
                item.setUpdatedAt(new Timestamp(System.currentTimeMillis()));
                attributeDao.updateAttribute(item);
            });
        }

//==========================================DD - A=========================================================
        int idDataDictionary = 0;
        for (DataDictonary dataDictonary : dataDictionaryDao.getAllDataDictonaries()) {
            if (dataDictonary.getDataDictionaryCode().equalsIgnoreCase(tfKodeDataDictionary.getText())) {
                idDataDictionary = dataDictonary.getId();
            }
        }

        Map<Integer, Integer> listIdDD = new HashMap<>();
        dataDictonaryAttibuteDao.getAllDataDictionaryAttributes().forEach((list) -> {
            listIdDD.put(list.getDataDictionaryId(), list.getDataDictionaryId());
        });

        int id = idDataDictionary;
        ArrayList<Attribute> currentAtributes = (ArrayList<Attribute>) attributeDao.getAllAttributes();
        if (listIdDD.get(id) == null) {
            if (listIdAttributes.isEmpty()) {
                items.forEach((item) -> {
                    for (Attribute attribute : currentAtributes) {
                        if (item.getAttributeName().equalsIgnoreCase(attribute.getAttributeName())) {
                            dataDictonaryAttibuteDao.saveDataDictionaryAttribute(
                                    new DataDictionaryAttribute(0, id, attribute.getId(),
                                            new Timestamp(System.currentTimeMillis()),
                                            null));
                        }
                    }
                });
            }
        }
//==================================================WORD=====================================================                
        try {
            msWordGenerate(id);
        } catch (Exception ex) {
            Logger.getLogger(UtamaController.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println("Sukses fungsi write!");
    }

    //fungsi ini untuk generate data dictionary ke bentuk JSON
    @FXML
    private void generateToJSON() throws Exception {
        ArrayList<String> errors = new ArrayList<>();
        if (tfDokumen.getText().equalsIgnoreCase("")) {
            errors.add("Kolom dokumen tidak boleh kosong");
        }
        if (tfKode.getText().equalsIgnoreCase("")) {
            errors.add("Kolom kode tidak boleh kosong");
        }
        if (tfNamaProses.getText().equalsIgnoreCase("")) {
            errors.add("Kolom nama proses tidak boleh kosong");
        }
        if (tfAktivitas.getText().equalsIgnoreCase("")) {
            errors.add("Kolom aktivitas tidak boleh kosong");
        }
        if (tfAktor.getText().equalsIgnoreCase("")) {
            errors.add("Kolom Aktor tidak boleh kosong");
        }
        if (cbDocumentType.getSelectionModel().isEmpty()) {
            errors.add("Tipe dokumen tidak boleh kosong");
        }

        if (errors.size() > 0) {
            Alert test = new Alert(Alert.AlertType.WARNING);
            test.setTitle("Notification");
            test.setHeaderText("Gagal digenerate!");
            String message = "";
            for (String error : errors) {
                message = message + "\n" + error;
            }
            test.setContentText(message);
            test.showAndWait();
        } else {

            Alert confirm = new Alert(Alert.AlertType.CONFIRMATION);
            confirm.setTitle("Konfirmasi");
            confirm.setHeaderText("Klik OK untuk generate data dictionary");
            confirm.showAndWait();
            if (confirm.getResult().getText().equals("OK")) {
                if (taDescription.getText().equalsIgnoreCase("")) {
                    taDescription.setText("-");
                }
                
                write();
                read();
                
                Gson gson = new GsonBuilder().setPrettyPrinting().create();
                ArrayList<Attribute> generatedAttributes = new ArrayList();

                JSONObject obj = new JSONObject();
                obj.put("dataDictionaryCode", tfKodeDataDictionary.getText());
                obj.put("documentName", tfDokumen.getText());
                obj.put("dataForm", cbDocumentType.getValue().toString());
                obj.put("processCode", tfKode.getText());
                obj.put("processName", tfNamaProses.getText());
                obj.put("activity", tfAktivitas.getText());
                obj.put("actor", tfAktor.getText());
                obj.put("description", tfDeskripsi.getText());

                JSONArray list = new JSONArray();
                items.forEach((item) -> {
                    JSONObject obj2 = new JSONObject();
                    obj2.put("attributeName", item.getAttributeName());
                    obj2.put("dataType", item.getDataType());
                    obj2.put("length", item.getLength());
                    obj2.put("description", item.getDescription());
                    obj2.put("alias", item.getAlias());
                    list.add(obj2);
                    generatedAttributes.add(new Attribute(item.getId(), item.getAttributeName(), item.getDataType(),
                            item.getLength(), item.getDescription(), item.getAlias(),
                            item.getCreatedAt(),
                            item.getUpdatedAt()));

                });
                obj.put("attributes", list);
                String jsonStringss = gson.toJson(obj);

                System.out.print(jsonStringss);

                try (FileWriter file = new FileWriter(path + tfKodeDataDictionary.getText() + ".json")) {
                    file.write(jsonStringss);
                    file.flush();
                } catch (IOException e) {
                }

                reset();
                tfDeskripsi.clear();
                tfAktivitas.clear();
                tfAktor.clear();
                tfKode.clear();
                tfKodeDataDictionary.clear();
                tfNamaProses.clear();
                tfDokumen.clear();

                Alert test = new Alert(Alert.AlertType.INFORMATION);
                test.setTitle("Notification");
                test.setHeaderText("Berhasil digenerate!");
                test.showAndWait();
                clearTable();
                cellValue = null;
            }
        }
    }

    //fungsi ini fungsi yang pertama dijalankan, sehingga inisialisasi dapat dilakukan disini
    @Override
    public void initialize(URL location, ResourceBundle resources) {
        tableViewDD.setEditable(true);
        field.setCellValueFactory(new PropertyValueFactory<Attribute, String>("field"));
        dataType.setCellValueFactory(new PropertyValueFactory<Attribute, String>("dataType"));
        length.setCellValueFactory(new PropertyValueFactory<Attribute, String>("length"));
        description.setCellValueFactory(new PropertyValueFactory<Attribute, String>("description"));
        alias.setCellValueFactory(new PropertyValueFactory<Attribute, String>("alias"));

        cbDocumentType.getItems().add("Laporan tercetak");
        cbDocumentType.getItems().add("Dokumen tercetak");
        cbDocumentType.getItems().add("Formulir");
        cbDocumentType.getItems().add("Digital");
        
        loadTable();
        loadDataType();
        selectListViewItem();
        selectTableViewItem();
        selectComboBoxItem();

        read();

        Image img1 = new Image(getClass().getResourceAsStream("/icons8-plus-26.png"));
        Image img2 = new Image(getClass().getResourceAsStream("/icons8-delete-50.png"));
        Image img3 = new Image(getClass().getResourceAsStream("/icons8-synchronize-24.png"));

        ImageView iv1 = new ImageView(img1);
        iv1.setFitHeight(25);
        iv1.setFitWidth(25);
        btnTambah.setGraphic(iv1);
        ImageView iv2 = new ImageView(img2);
        iv2.setFitHeight(25);
        iv2.setFitWidth(25);
        btnDelete.setGraphic(iv2);

        ImageView iv3 = new ImageView(img3);
        iv3.setFitHeight(25);
        iv3.setFitWidth(25);
        btnReset.setGraphic(iv3);
    }

    //fungsi ini untuk menghapus atribut yang ada pada list atribut
    @FXML
    private void deleteData() {
        if (cellValue.equalsIgnoreCase("") || cellValue == null) {
        } else {
            int id = 0;
            for (Attribute item : items) {
                if (item.getAttributeName().equalsIgnoreCase(cellValue)) {
                    items.remove(id);
                }
                id++;
            }
            reset();
            loadTable();
            cellValue = "";
        }
    }

    //fungsi ini untuk mereset semua kolom input
    @FXML
    private void resetForm() {
        reset();
    }

    //fungsi ini untuk mereset semua kolom input
    private void reset() {
        tfField.clear();
        tfAlias.clear();
        tfLength.clear();
        taDescription.clear();
        cellValue = "";
        cellValue = null;
    }

    //fungsi ini untuk membersihkan isi table atribut
    private void clearTable() {
        tableViewDD.getItems().clear();
    }

    //fungsi ini untuk meload atribut dari data object ke table
    private void loadTable() {
        tableViewDD.refresh();
        tableViewDD.sort();
        tableViewDD.setItems(items);
    }

    //fungsi ini untuk membersihkan semua kolom input untuk atribut
    private void clearAttributeForm() {
        tfField.clear();
        tfAlias.clear();
        tfLength.clear();
        tfDeskripsi.clear();
    }

    //fungsi ini untuk menampilkan length berdasarkan tipe data yang dipilih/klik
    private void selectComboBoxItem() {
        cbDataType.getSelectionModel().selectedItemProperty()
                .addListener(new ChangeListener<String>() {
                    public void changed(
                            ObservableValue<? extends String> observable,
                            String oldValue, String newValue) {
                        tfLength.setText(mapDataType.get(newValue));
                    }
                });
    }
}
